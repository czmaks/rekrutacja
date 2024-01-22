from fastapi import FastAPI, Request, Depends, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm import Session, joinedload
from models import Nbp, Ebook
from database import get_db

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.post("/post")
async def post_data(data: Request, db: Session = Depends(get_db)):
    json_data = await data.json()
    existing_ebooks = db.query(Ebook).filter_by(title=json_data["title"], date=json_data["date"]).all()
    if existing_ebooks:
        return {"message": "Already in db!"}

    try:
        ebook = Ebook(name=json_data['name'], title=json_data['title'], curr=json_data['curr'], price=json_data['price'], date=json_data['date'])
        db.add(ebook)
        db.commit()
        
        nbp = Nbp(ebook_id=ebook.id, rate=json_data['fromNBP']['rate'], pricePLN=json_data['fromNBP']['pricePLN'], tableNo=json_data['fromNBP']['tableNo'])
        db.add(nbp)
        db.commit()

        return {"message": "Ebook added to db!"}
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/getall")
async def get_all(db: Session = Depends(get_db)):
    ebooks = db.query(Ebook).options(
        joinedload(Ebook.fromNBP)
    ).all()
    return {"ebooks": ebooks}
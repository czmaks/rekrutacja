from sqlalchemy import create_engine
import os
from sqlalchemy.orm import sessionmaker
from dotenv import load_dotenv

load_dotenv()

DB_URL = 'postgresql://{0}:{1}@localhost:5432/{2}'.format(os.getenv("USER"), os.getenv("PASS"), os.getenv("DB"))
print(DB_URL)
engine = create_engine(DB_URL)

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
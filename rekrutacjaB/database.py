from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base, relationship

DB_URL = 'postgresql://maks@localhost:5432/onwelotask'

engine = create_engine(DB_URL)

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
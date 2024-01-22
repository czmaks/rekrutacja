from sqlalchemy import Column, String, Float, Date, JSON, ForeignKey, Integer
from sqlalchemy.orm import declarative_base, relationship
from database import engine

Base = declarative_base()

class Nbp(Base):
    __tablename__ = 'nbp_data'

    id = Column(Integer, primary_key=True, index=True)
    ebook_id = Column(Integer, ForeignKey('ebooks.id'))
    rate = Column(Float)
    pricePLN = Column(Float)
    tableNo = Column(String)
    ebook = relationship("Ebook", back_populates="fromNBP")

class Ebook(Base):
    __tablename__ = 'ebooks'

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, index=True)
    title = Column(String)
    curr = Column(String)
    price = Column(Float)
    date = Column(Date)
    fromNBP = relationship("Nbp", back_populates='ebook', uselist=False)


Base.metadata.create_all(bind=engine)
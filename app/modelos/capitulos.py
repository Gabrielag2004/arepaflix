from sqlalchemy import Column, DateTime, Integer, func
from sqlalchemy.orm import relationship
from app.database import Base

class Capitulo(Base):
    __tablename__ = "capitulos"

    id: Column[int] = Column(Integer, primary_key=True, index=True)
    numero_capitulo: Column[int] = Column(Integer, nullable=False)
    fecha_publicacion: Column[DateTime] = Column(DateTime, default=func.now(), nullable=False)

    temporadas = relationship(argument="Temporada", back_populates="capitulos") 
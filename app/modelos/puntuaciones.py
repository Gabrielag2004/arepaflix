from sqlalchemy import Column, DateTime, Integer, Numeric, func
from decimal import Decimal as decimal
from sqlalchemy.orm import relationship
from app.database import Base

class Puntuacion(Base):
    __tablename__ = "puntuaciones"

    id: Column[int] = Column(Integer, primary_key=True, index=True)
    valor: Column[decimal] = Column(Numeric(2,1), nullable=False) 
    fecha_publicacion = Column(DateTime, default=func.now(), nullable=False)

    contenidos = relationship(argument="Contenido", back_populates="puntuaciones") 
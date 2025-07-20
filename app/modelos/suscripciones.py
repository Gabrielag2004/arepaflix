from sqlalchemy import Column, Integer, String, Numeric
from decimal import Decimal as decimal
from sqlalchemy.orm import relationship
from app.database import Base

class Suscripcion(Base):
    __tablename__ = "suscripciones"

    id: Column[int] = Column(Integer, primary_key=True, index=True)
    nombre: Column[str] = Column(String(length=50), nullable=False)
    caracteristicas: Column[str] = Column(String(length=200), nullable=True)
    precio: Column[decimal] = Column(Numeric(10,2), nullable=False) 
    cantidad_pantallas: Column[int] = Column(Integer, nullable=False)
    duracion_meses: Column[int] = Column(Integer, nullable=False)

    contenidos_suscripciones = relationship(argument="ContenidoSuscripcion", back_populates="suscripciones") 
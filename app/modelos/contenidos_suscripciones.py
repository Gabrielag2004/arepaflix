from sqlalchemy import Column, ForeignKey, Integer, String
from sqlalchemy.orm import relationship
from app.database import Base

class ContenidoSuscripcion(Base):
    __tablename__ = "contenidos_suscripciones"

    id: Column[int] = Column(Integer, primary_key=True, index=True)
    suscripcion_id: Column[int] = Column(Integer, ForeignKey("suscripciones.id"), nullable=False)
    contenido_id: Column[int] = Column(Integer, ForeignKey("contenidos.id"), nullable=False)
    calidad_disponible: Column[str] = Column(String(length=5), nullable=False)

    suscripciones = relationship(argument="Suscripcion", back_populates="contenidos_suscripciones")
    contenidos = relationship(argument="Contenido", back_populates="contenidos_suscripciones")
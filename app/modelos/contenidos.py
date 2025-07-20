from sqlalchemy import Column, DateTime, ForeignKey, Integer, String, func
from sqlalchemy.orm import relationship
from app.database import Base

class Contenido(Base):
    __tablename__ = "contenidos"

    id: Column[int] = Column(Integer, primary_key=True, index=True)
    puntuacion_id: Column[int] = Column(Integer, ForeignKey("puntuaciones.id"), nullable=False)
    comentario_id: Column[int] = Column(Integer, ForeignKey("comentarios.id"), nullable=False)
    temporada_id: Column[int] = Column(Integer, ForeignKey("temporadas.id"), nullable=False)
    nombre: Column[str] = Column(String(length=50), nullable=False)
    descripcion: Column[str] = Column(String(length=200), nullable=False)
    genero: Column[str] = Column(String(length=50), nullable=True)
    ano_lanzamiento: Column[int] = Column(Integer, nullable=True)
    cantidad_temporada: Column[int] = Column(Integer, nullable=True)
    fecha_publicacion: Column[DateTime] = Column(DateTime, default=func.now(), nullable=False)

    temporadas = relationship(argument="Temporada", back_populates="contenidos") 
    comentarios = relationship(argument="Comentario", back_populates="contenidos") 
    puntuaciones = relationship(argument="Puntuacion", back_populates="contenidos")
    contenidos_suscripciones = relationship(argument="ContenidoSuscripcion", back_populates="contenidos") 
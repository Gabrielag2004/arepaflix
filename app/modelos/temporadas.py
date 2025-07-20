from sqlalchemy import Column, DateTime, Integer, func, ForeignKey
from sqlalchemy.orm import relationship
from app.database import Base

class Temporada(Base):
    __tablename__ = "temporadas"

    id: Column[int] = Column(Integer, primary_key=True, index=True)
    capitulo_id: Column[int] = Column(Integer, ForeignKey(column="capitulos.id"), nullable=False)
    numero_temporada: Column[int] = Column(Integer, nullable=False)
    cantidad_capitulo: Column[int] = Column(Integer, nullable=False)
    ano_lanzamiento: Column[int] = Column(Integer, nullable=True)
    fecha_publicacion: Column[DateTime] = Column(DateTime, default=func.now(), nullable=False)

    capitulos = relationship(argument="Capitulo", back_populates="temporadas")
    contenidos = relationship(argument="Contenido", back_populates="temporadas") 
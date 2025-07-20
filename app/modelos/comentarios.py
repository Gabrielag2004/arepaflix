from sqlalchemy import Column, DateTime, Integer, String, func
from sqlalchemy.orm import relationship
from app.database import Base

class Comentario(Base):
    __tablename__ = "comentarios"

    id: Column[int] = Column(Integer, primary_key=True, index=True)
    comentario: Column[str] = Column(String(length=400), nullable=False)
    fecha_publicacion: Column[DateTime] = Column(DateTime, default=func.now(), nullable=False)

    contenidos = relationship(argument="Contenido", back_populates="comentarios") 
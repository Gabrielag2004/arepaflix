from pydantic import BaseModel, Field
from decimal import Decimal as decimal

class CrearSuscripcion(BaseModel):
    nombre: str = Field(..., min_length=3, max_length=50)
    caracteristicas: str | None = Field(None, min_length=10, max_length=200)
    precio: decimal 
    cantidad_pantallas: int
    duracion_meses: int

class DevolverSuscripcion(BaseModel):
    nombre: str
    caracteristicas: str | None = None
    precio: decimal
    cantidad_pantallas: int
    duracion_meses: int

class ActualizarSuscripcion(BaseModel):
    nombre: str | None = Field(None, min_length=3, max_length=50)
    caracteristicas: str | None = Field(None, min_length=10, max_length=200)
    precio: decimal | None = None
    cantidad_pantallas: int | None = None
    duracion_meses: int | None = None
from fastapi import FastAPI, Body, status
from typing import Annotated
from app.schemas import CrearSuscripcion, DevolverSuscripcion, ActualizarSuscripcion
from sqlalchemy import insert, select, update, delete
from app.modelos.contenidos import Contenido
from app.modelos.temporadas import Temporada
from app.modelos.capitulos import Capitulo
from app.modelos.comentarios import Comentario
from app.modelos.puntuaciones import Puntuacion
from app.modelos.suscripciones import Suscripcion
from app.modelos.contenidos_suscripciones import ContenidoSuscripcion
from app.database import engine, SessionLocal, Base

Base.metadata.create_all(bind=engine)

app = FastAPI()

@app.post(
    "/suscripciones/",
    status_code=status.HTTP_201_CREATED,
    description="Crear nueva suscripcion",
    response_model=str
    )
async def create_suscripcion(
    suscripcion: Annotated[CrearSuscripcion, Body()] 
): 
    conexion = SessionLocal()

    sentencia = insert(Suscripcion).values(
        nombre=suscripcion.nombre,
        caracteristicas=suscripcion.caracteristicas,
        precio=suscripcion.precio,
        cantidad_pantallas=suscripcion.cantidad_pantallas,
        duracion_meses=suscripcion.duracion_meses,
    )

    conexion.execute(sentencia)
    conexion.commit()
    conexion.close()
    
    return "ok"

@app.get(
    "/suscripciones/",
    status_code=status.HTTP_200_OK,
    description="Mostrar suscripciones",
    response_model=list[DevolverSuscripcion],
    )
async def read_suscripcion(): 
    conexion = SessionLocal()

    sentencia = select(
        Suscripcion.id,
        Suscripcion.nombre,
        Suscripcion.caracteristicas,   
        Suscripcion.precio,
        Suscripcion.cantidad_pantallas,
        Suscripcion.duracion_meses
        ).select_from(Suscripcion)
    
    resultado = conexion.execute(sentencia)
    resultados = resultado.all()

    conexion.close()

    return resultados

@app.delete(
    "/suscripciones/{suscripcion_id}",
    status_code=status.HTTP_200_OK,
    description="Eliminar suscripcion",
    response_model=str
    )
async def delete_suscripcion(suscripcion_id: int):
    conexion = SessionLocal()

    sentencia = delete(table=Suscripcion).where(Suscripcion.id == suscripcion_id)

    conexion.execute(sentencia)
    conexion.commit()
    conexion.close()

    return "ok"

@app.put(
    "/suscripciones/{suscripcion_id}",
    status_code=status.HTTP_200_OK,
    description="Actualizar suscripcion",
    response_model=str
    )
async def update_suscripcion(
    suscripcion_id: int,
    suscripcion_actualizado: Annotated[ActualizarSuscripcion, Body()] #Bosy y parameter
): 
    conexion = SessionLocal()

    valores = suscripcion_actualizado.model_dump(exclude_unset=True)

    sentencia = update(Suscripcion).values(valores).where(Suscripcion.id == suscripcion_id)


    conexion.execute(sentencia)
    conexion.commit()
    conexion.close()

    return "ok"
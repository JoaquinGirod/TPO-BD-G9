# TPO Bases de Datos 2

Este workspace contiente los ejercicios 1 y 3 solicitados para el trabajo, donde se trabajará sobre MongoDB y Redis, respectivamente.

Integrantes
- Luca Seggiaro
- Felix Lopez Menardi
- Joaquin Girod

## Mongo

### Setup
Desde el root ejecutar:
1. ```cd mongo``` para localizarnos en la carpeta de Mongo.
2. ```bash setup_mongo.sh``` para que se instale la imagen, se suban los archivos y posicionarse en la terminal mongosh.
3. ```use tpo``` para utilizar la base de datos "tpo".
4. Copiar y ejecutar las queries que se deseen.

### Query 1 :  Conteo de Albumes por Año
```js
db.albums.aggregate([
  {
    $group: {
      _id: "$Year",
      total: { $sum: 1 }
    }
  },
  {
    $sort: {
    total: -1
   }
  },
  {
    $project: {
      _id: 0,
      year: "$_id",
      total: 1
    }
  }
])
```

### Query 2 : Adicion de Campo Score
```js
db.albums.updateMany(
  {}, 
  [
    {
      $set: {
        Score: { $subtract: [501, "$Number"] } 
      }
    }
  ]
)

```

### Query 3 : Score de Cada Artista
```js
db.albums.updateMany(
  {}, 
  [
    {
      $set: {
        Score: { $subtract: [501, "$Number"] } 
      }
    }
  ]
)
db.albums.aggregate([
  {
    $group: {
      _id: "$Artist",
      totalScore: { $sum: "$Score" } 
    }
  },
  {
    $project: {
      _id: 0,
      Artist: "$_id",
      totalScore: 1
    }
  },
  {
    $sort: {
      totalScore: -1 
    }
  }
])

```

## Redis

### Setup
Desde el root ejecutar:
1. ```cd redis``` para localizarnos en la carpeta de Redis.
2. ```bash setup_redis.sh``` para que se instale la imagen, se suban los archivos necesarios al igual que el data set y se ejecuten las queries. (Tarda unos segundos en parsear el csv durante la ejecucion)

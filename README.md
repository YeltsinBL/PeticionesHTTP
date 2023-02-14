# Peticiones HTTP
## _Introducción a las peticiones HTTP_

Realizar ejemplos de como se consume una api utilizando URLSession, JsonDecoder, decodeIfPresent, nestedContainer y Callbacks vs Async/Await.

`URLSession`: sirve para realizar peticiones HTTP y obtener información de Backend, esta información puede ser en formato Json u otros.
Una petición HTTP es asíncrono, significa que no sabemos cuando recibiremos la respuesta.

JsonSerialization: una vez recibimos información de la URL, debemos de convertir la data que recibimos de tipo byte a Json.

`Decodable`: hace que la información del json que recibimos sea entendible por la aplicación y podamos utilizar esta información de una manera más cómoda.
JsonDecoder: parsea la información del json a un modelo del tipo 'struct', 'class'.
CodingKeys: es un enum que permite hacer un mapeo manual cuando los nombres de json y de la las propiedades del 'struct' o 'class' no son igual.

`DecodeIfPresent`: para evitar que se cierre la aplicación si el mapeo del json con el modelo de la aplicación no tienen los mismos nombres o no se envían.
- Si no se envía el valor desde el Json, entonces le asignara un valor nil a la propiedad del modelo.

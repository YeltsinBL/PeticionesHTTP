# Peticiones HTTP
## _Introducción a las peticiones HTTP_

Realizar ejemplos de como se consume una api utilizando URLSession, JsonDecoder, decodeIfPresent, nestedContainer y Callbacks vs Async/Await.

`URLSession`: sirve para realizar peticiones HTTP y obtener información de Backend, esta información puede ser en formato Json u otros.
Una petición HTTP es asíncrono, significa que no sabemos cuando recibiremos la respuesta.

JsonSerialization: una vez recibimos información de la URL, debemos de convertir la data que recibimos de tipo byte a Json.

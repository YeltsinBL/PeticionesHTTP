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

`NestedContainer`: cuando recibimos información excesiva en el Json de forma anidada, con el 'NestedContainer' podemos acceder a esa información anidada sin crear nuevos modelos para asignar sus valores a las propiedades del modelo ya existente.
- Para utilizar el 'NestedContainer', primero se tiene que hacer los CodingKeys y el init; dentro del init se podrá utilizar.

`URLession > Pokemon`: utilizamos la petición Http junto con el JSONDecoder para aplicar todo lo aprendido anteriormente.
- PokemonViewModel: creamos los modelos y mapeamos manualmente los datos utilizando el CodingKeys e init.
-- Creamos una clase de tipo 'ObservableObject' para utilizar y publicar los cambios en una variable, que se utilizará en la vista.
-- Realizamos la petición Http y mapeamos los datos obtenidos con el modelo.
-- Al obtener los datos y actualizar el valor en la variable pública, esta se hace en un hilo de background, por lo cual se debe de realizar dentro del 'DispatchQueue' que es el hilo principal.
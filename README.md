# Alimento

La gema Alimento contiene la clase alimento, la cual permite la creación de un objeto Alimento con un identificador literal y unas componentes
basadas en los glúcidos, lípidos y proteínas para gestionar las calorías proporcionadas por este.

## Instalación

Añade esta línea a tu documento Gemgfile:

```ruby
gem 'Alimento'
```

y ejecuta el comando:

    $ bundle

O realiza una instalación directa con:

    $ gem install Alimento

## Detalles de las clases

### Alimento
- Creacion de Alimento: Alimento.new(<Nombre del alimento>, <gramos de glúcidos>, <gramos de proteínas>, <gramos de lípidos>).
- Tiene métodos para el acceso de lectura a los atributos _nombre_, _glucidos_, _proteinas_ y _lipidos_.
- kcal: método para el cálculo. Devuelve el valor energético del alimento en kilocalorías.

### AlimentoCategorizable

### Lista

### GrupoAlimenticio

## Licencia

La gema está disponible como código abierto bajo los términos de la [Licencia MIT](http://opensource.org/licenses/MIT).
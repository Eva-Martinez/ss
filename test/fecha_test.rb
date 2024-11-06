require 'test/unit'
require_relative '../lib/ss/fecha'

# Clase que contiene las pruebas unitarias de la clase Fecha.
class TestFecha < Test::Unit::TestCase
  # Método para inicializar las pruebas de la clase Fecha.
  def setup
    @fecha = Ss::Fecha.new(1, 1, 2024)
    @fecha1 = Ss::Fecha.new(29, 2, 2032)
  end

  # Prueba para verificar que cada objeto Fecha tiene los atributos correctos.
  def test_atributos_fecha
    assert_equal(1, @fecha.dia)
    assert_equal(1, @fecha.mes)
    assert_equal(2024, @fecha.año)
  end

  # Prueba para verificar que se lanzan errores con valores inválidos.
  def test_errores_valores
    assert_raise(ArgumentError) { Ss::Fecha.new(0, 1, 2024) }
    assert_raise(ArgumentError) { Ss::Fecha.new(15, 13, 2030) }
    assert_raise(ArgumentError) { Ss::Fecha.new(7, 7, -1) }
  end

  # Prueba para verificar que se lanzan errores con tipos de datos incorrectos.
  def test_errores_tipo
    assert_raise(TypeError) { Ss::Fecha.new("1", 1, 2024) }
    assert_raise(TypeError) { Ss::Fecha.new(1, '1', 2024) }
    assert_raise(TypeError) { Ss::Fecha.new(1, 1, :"2024") }
  end

  # Prueba para verificar el método to_s en una instancia válida.
  def test_to_s
    expected_output = "Día: 1, Mes: 1, Año: 2024"
    assert_equal(expected_output, @fecha.to_s)
    expected_output1 = "Día: 29, Mes: 2, Año: 2032"
    assert_equal(expected_output1, @fecha1.to_s)
  end
end
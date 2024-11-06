# frozen_string_literal: true

require "test_helper"

class SsTest < Test::Unit::TestCase
  test "VERSION" do
    assert do
      ::Ss.const_defined?(:VERSION)
    end
  end

  test "something useful" do
    assert_equal("expected", "expected")
  end

  # Pruebas para las constantes correspondientes a los niveles del SET
  test "NIVELI" do
    assert do
      ::Ss.const_defined?(:NIVELI)
    end
  end
  test "NIVELII" do
    assert do
      ::Ss.const_defined?(:NIVELII)
    end
  end
  test "NIVELIII" do
    assert do
      ::Ss.const_defined?(:NIVELIII)
    end
  end
  test "NIVELIV" do
    assert do
      ::Ss.const_defined?(:NIVELIV)
    end
  end
  test "NIVELV" do
    assert do
      ::Ss.const_defined?(:NIVELV)
    end
  end

  # Pruebas para el método "dif_fechas"
  test "dif_fechas" do
    assert do
      ::Ss.respond_to?(:dif_fechas)
    end
    assert_equal("La diferencia es de 0 años, 0 meses y 0 días", Ss.dif_fechas(Ss::Fecha.new(1, 5, 2024), Ss::Fecha.new(1, 5, 2024)))
    assert_equal("La diferencia es de 4 años, 3 meses y 21 días", Ss.dif_fechas(Ss::Fecha.new(20, 11, 2024), Ss::Fecha.new(30, 7, 2020)))
    assert_equal("La diferencia es de 8 años, 1 meses y 16 días", Ss.dif_fechas(Ss::Fecha.new(30, 12, 2015), Ss::Fecha.new(15, 2, 2024)))
  end

  # Pruebas para el método "dif_horas"
  test "dif_horas" do
    assert do
      ::Ss.respond_to?(:dif_horas)
    end
    assert_equal("La diferencia es de 0 horas, 0 minutos y 0 segundos", Ss.dif_horas(Ss::Hora.new(0, 0, 0), Ss::Hora.new(0, 0, 0)))
    assert_equal("La diferencia es de 4 horas, 3 minutos y 39 segundos", Ss.dif_horas(Ss::Hora.new(23, 59, 59), Ss::Hora.new(4, 3, 38)))
    assert_equal("La diferencia es de 15 horas, 58 minutos y 44 segundos", Ss.dif_horas(Ss::Hora.new(15, 30, 45), Ss::Hora.new(7, 29, 29)))
  end

  # Pruebas para el método "determinar_nivel_prioridad"
  test "determinar_nivel_prioridad" do
    assert do
      ::Ss.respond_to?(:determinar_nivel_prioridad)
    end
    assert_equal("El nivel de prioridad es Reanimacion", Ss.determinar_nivel_prioridad(Ss::Hora.new(12, 30, 0), Ss::Hora.new(12, 30, 15)))
    assert_equal("El nivel de prioridad es Emergencia", Ss.determinar_nivel_prioridad(Ss::Hora.new(12, 30, 15), Ss::Hora.new(12, 35, 45)))
    assert_equal("El nivel de prioridad es Urgente", Ss.determinar_nivel_prioridad(Ss::Hora.new(12, 35, 45), Ss::Hora.new(13, 2, 15)))
    assert_equal("El nivel de prioridad es Menos urgente", Ss.determinar_nivel_prioridad(Ss::Hora.new(23, 30, 10), Ss::Hora.new(0, 10, 59)))
    assert_equal("El nivel de prioridad es No urgente", Ss.determinar_nivel_prioridad(Ss::Hora.new(0, 10, 59), Ss::Hora.new(3, 30, 32)))
  end
end

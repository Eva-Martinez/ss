# Clase que representa una fecha.
# Esta clase contiene los atributos dia, mes y año.
module Ss
  class Fecha
    # Atributos de la clase Fecha.
    attr_reader :dia, :mes, :año
    attr_writer :dia, :mes, :año

    # Método para inicializar los objetos de la clase Fecha.
    def initialize(dia, mes, año)
      @dia, @mes, @año = dia, mes, año
      # Verificar si los atributos son válidos
      verify_fecha
    end

    # Método para mostrar los atributos de la clase Fecha.
    def to_s
      "Día: #{@dia}, Mes: #{@mes}, Año: #{@año}"
    end

    # Método auxiliar para determinar si un año es bisiesto.
    def es_bisiesto?(año)
      (año % 4 == 0 && año % 100 != 0) || (año % 400 == 0)
    end

    # Método para verificar el valor de los atributos de la clase Fecha.
    def verify_fecha
      # Validaciones de tipo
      raise TypeError, "El día debe ser un número entero" unless @dia.is_a?(Integer)
      raise TypeError, "El mes debe ser un número entero" unless @mes.is_a?(Integer)
      raise TypeError, "El año debe ser un número entero" unless @año.is_a?(Integer)

      # Verificar la cantidad de días permitidos en el mes actual
      dias_validos = case @mes
      when 1, 3, 5, 7, 8, 10, 12
        31
      when 4, 6, 9, 11
        30
      when 2
        es_bisiesto?(@año) ? 29 : 28
      end

      # Verificar si @dia es válido
      unless (1..dias_validos).include?(@dia)
        raise ArgumentError, "Error: El día '#{@dia}' no es correcto para el mes #{@mes} y el año #{@año}."
      end

      # Validaciones de valores permitidos para mes
      meses_validos = (1..12).to_a

      # Verificar si @mes es válido
      unless meses_validos.include?(@mes)
        raise ArgumentError, "Error: El mes '#{@mes}' no es correcto."
      end

      # Verificar si @año es válido
      unless @año >= 0
        raise ArgumentError, "Error: El año '#{@año}' no es correcto."
      end

      # Si todos los atributos son válidos, retornar true
      return true
    end
  end
end
# Clase que representa una hora.
# Esta clase contiene los atributos hora, minuto y segundo.
module Ss
  class Hora
    # Atributos de la clase Hora.
    attr_reader :hora, :minuto, :segundo
    attr_writer :hora, :minuto, :segundo

    # Método para inicializar los objetos de la clase Hora.
    def initialize(hora, minuto, segundo)
      @hora, @minuto, @segundo = hora, minuto, segundo
      # Verificar si los atributos son válidos
      verify_hora
    end

    # Método para mostrar los atributos de la clase Hora.
    def to_s
      "Hora: #{@hora}, Minuto: #{@minuto}, Segundo: #{@segundo}"
    end

    # Método para verificar el valor de los atributos de la clase Hora.
    def verify_hora
      # Validaciones de tipo
      raise TypeError, "La hora debe ser un número entero" unless @hora.is_a?(Integer)
      raise TypeError, "El minuto debe ser un número entero" unless @minuto.is_a?(Integer)
      raise TypeError, "El segundo debe ser un número entero" unless @segundo.is_a?(Integer)

      # Validaciones de valores permitidos
      horas_validas = (0..23).to_a
      minutos_validos = (0..59).to_a
      segundos_validos = (0..59).to_a

      # Verificar si @hora es válido
      unless horas_validas.include?(@hora)
        raise ArgumentError, "Error: La hora '#{@hora}' no es correcta."
      end

      # Verificar si @minuto es válido
      unless minutos_validos.include?(@minuto)
        raise ArgumentError, "Error: El minuto '#{@minuto}' no es correcto."
      end

      # Verificar si @segundo es válido
      unless segundos_validos.include?(@segundo)
        raise ArgumentError, "Error: El segundo '#{@segundo}' no es correcto."
      end

      # Si todos los atributos son válidos, retornar true
      return true
    end
  end
end
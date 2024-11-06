# Clase que representa un nivel del SET.
# Esta clase contiene los niveles del SET con los atributos nivel, color, categoría y tiempo de atención.
module Ss
  class Nivel
    # Atributos de la clase Nivel.
    attr_reader :nivel, :color, :categoria, :tiempo_atencion
    attr_writer :nivel, :color, :categoria, :tiempo_atencion

    # Método para inicializar los objetos de la clase Nivel.
    def initialize(nivel, color, categoria, tiempo_atencion)
      @nivel, @color, @categoria, @tiempo_atencion = nivel, color, categoria, tiempo_atencion
      # Verificar si los atributos son válidos
      verify_nivel
    end

    # Método para mostrar los atributos de la clase Nivel.
    def to_s
      "Nivel: #{@nivel}, Color: #{@color}, Categoría: #{@categoria}, Tiempo de atención: #{@tiempo_atencion}"
    end

    # Método para verificar el valor de los atributos de la clase Nivel.
    def verify_nivel
      # Validaciones de tipo
      raise TypeError, "El nivel debe ser una cadena" unless @nivel.is_a?(String)
      raise TypeError, "El color debe ser un símbolo" unless @color.is_a?(Symbol)
      raise TypeError, "La categoría debe ser un símbolo" unless @categoria.is_a?(Symbol)
      raise TypeError, "El tiempo de atención debe ser un número entero" unless @tiempo_atencion.is_a?(Integer)

      # Validaciones de valores permitidos
      niveles_validos = ["I", "II", "III", "IV", "V"]
      colores_validos = [:Azul, :Rojo, :Naranja, :Verde, :Negro]
      categorias_validas = [:Reanimacion, :Emergencia, :Urgente, :"Menos urgente", :"No urgente"]
      tiempos_validos = [0, 7, 30, 45, 60]

      # Verificar si @nivel es válido
      unless niveles_validos.include?(@nivel)
        raise ArgumentError, "Error: El nivel '#{@nivel}' no es correcto. Valores válidos: #{niveles_validos.join(', ')}."
      end

      # Verificar si @color es válido
      unless colores_validos.include?(@color)
        raise ArgumentError, "Error: El color '#{@color}' no es correcto. Valores válidos: #{colores_validos.join(', ')}."
      end

      # Verificar si @categoria es válido
      unless categorias_validas.include?(@categoria)
        raise ArgumentError, "Error: La categoria '#{@categoria}' no es correcta. Valores válidos: #{categorias_validas.join(', ')}."
      end

      # Verificar si @tiempo_atencion es válido
      unless tiempos_validos.include?(@tiempo_atencion)
        raise ArgumentError, "Error: El tiempo de atención '#{@tiempo_atencion}' no es correcto. Valores válidos: #{tiempos_validos.join(', ')} minutos."
      end
      
      # Si todos los atributos son válidos, retornar true
      return true
    end    
  end
end
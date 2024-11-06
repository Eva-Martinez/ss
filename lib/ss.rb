# frozen_string_literal: true

require_relative "ss/version"
require_relative "ss/nivel"
require_relative "ss/hora"
require_relative "ss/fecha"

module Ss
  class Error < StandardError; end
  # Constantes de los niveles del SET
  NIVELI = Ss::Nivel.new("I", :Azul, :Reanimacion, 0)
  NIVELII = Ss::Nivel.new("II", :Rojo, :Emergencia, 7)
  NIVELIII = Ss::Nivel.new("III", :Naranja, :Urgente, 30)
  NIVELIV = Ss::Nivel.new("IV", :Verde, :"Menos urgente", 45)
  NIVELV = Ss::Nivel.new("V", :Negro, :"No urgente", 60)

  # Método que devuelve la diferencia en días, meses y años entre dos fechas usando la clase Fecha.
  def self.dif_fechas(fecha1, fecha2)
    # Asegurarse de que fecha1 sea la más antigua
    if fecha1.año > fecha2.año || (fecha1.año == fecha2.año && fecha1.mes > fecha2.mes) || (fecha1.año == fecha2.año && fecha1.mes == fecha2.mes && fecha1.dia > fecha2.dia)
      fecha1, fecha2 = fecha2, fecha1
    end

    # Calcular la diferencia en años
    años = fecha2.año - fecha1.año

    # Calcular la diferencia en meses
    meses = fecha2.mes - fecha1.mes
    if meses < 0
      meses += 12
      años -= 1
    end

    # Calcular la diferencia en días
    dias = fecha2.dia - fecha1.dia
    if dias < 0
      # Obtener el número de días del mes anterior a fecha2
      dias_en_mes_anterior = case fecha2.mes - 1
                             when 1, 3, 5, 7, 8, 10, 12 then 31
                             when 4, 6, 9, 11 then 30
                             when 2 then fecha2.es_bisiesto?(fecha2.año) ? 29 : 28
                             else 0
                             end
      dias += dias_en_mes_anterior
      meses -= 1
      if meses < 0
        meses += 12
        años -= 1
      end
    end

    # Retornar la diferencia como un string
    "La diferencia es de #{años} años, #{meses} meses y #{dias} días"
  end

  # Método que devuelve la diferencia en horas, minutos y segundos entre dos horas usando la clase Hora.
  def self.dif_horas(hora1, hora2)
    # Convertir las dos horas a segundos desde el inicio del día
    segundos_hora1 = hora1.hora * 3600 + hora1.minuto * 60 + hora1.segundo
    segundos_hora2 = hora2.hora * 3600 + hora2.minuto * 60 + hora2.segundo

    # Si hora2 es anterior a hora1, entonces debemos sumar 24 horas (86400 segundos) a la diferencia
    if segundos_hora2 < segundos_hora1
      segundos_hora2 += 86400 # 24 horas en segundos
    end

    # Calcular la diferencia en segundos
    diferencia_segundos = segundos_hora2 - segundos_hora1

    # Calcular la diferencia en horas, minutos y segundos
    horas = diferencia_segundos / 3600
    minutos = (diferencia_segundos % 3600) / 60
    segundos = diferencia_segundos % 60

    # Retornar la diferencia como un string
    "La diferencia es de #{horas} horas, #{minutos} minutos y #{segundos} segundos"
  end

  # Método que devuelve según una hora de entrada y la hora actual un nivel de prioridad
  def self.determinar_nivel_prioridad(hora_entrada, hora_actual)
    # Convertir la hora de entrada y la hora actual en segundos desde medianoche
    segundos_hora_entrada = hora_entrada.hora * 3600 + hora_entrada.minuto * 60 + hora_entrada.segundo
    segundos_hora_actual = hora_actual.hora * 3600 + hora_actual.minuto * 60 + hora_actual.segundo

  # Calcular la diferencia en segundos, teniendo en cuenta el ciclo de 24 horas
  if segundos_hora_actual < segundos_hora_entrada
    segundos_hora_actual += 86400 # Añadir 24 horas en segundos si es un día siguiente
  end
  diferencia_segundos = segundos_hora_actual - segundos_hora_entrada
  diferencia_minutos = diferencia_segundos / 60

    # Asignar el nivel de prioridad según la diferencia de minutos
    if diferencia_minutos <= 0
      nivel = NIVELI
    end
    if diferencia_minutos > 0 && diferencia_minutos <= 7
      nivel = NIVELII
    end
    if diferencia_minutos > 7 && diferencia_minutos <= 30
      nivel = NIVELIII
    end
    if diferencia_minutos > 30 && diferencia_minutos <= 45
      nivel = NIVELIV
    end
    if diferencia_minutos > 45
      nivel = NIVELV
    end

    # Retornar el nivel de prioridad como un string
    "El nivel de prioridad es #{nivel.categoria}"
  end
end

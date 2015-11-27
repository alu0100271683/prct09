module Bib
    class Publicacion
        include Comparable
        attr_reader :nombre, :fecha
        def initialize(nombre, fecha)
            @nombre = nombre
            @fecha = fecha
        end
        def <=> (other)
            self.fecha <=> other.fecha
        end
        def ==(other)
            if other.is_a?Publication
                @nombre == other.nombre && @fecha == other.fecha
            else
                false
            end
        end
    end #class publicacion
    class Articulo < Publicacion
        attr_reader :autor, :numero, :pagina
        def initialize(nombre, fecha, autor, numero, pagina)
            super(nombre,fecha)
            @autor = autor
            @numero = numero
            @pagina = pagina
        end
        def <=> (other)
            self.fecha <=> other.fecha
        end
    end #class articulo
    class ARevista < Articulo
        attr_reader :revista, :edicion
        def initialize(nombre, fecha, autor, numero, pagina, revista, edicion)
            super(nombre, fecha, autor, numero, pagina)
            @revista = revista
            @edicion = edicion
        end
        def <=> (other)
            self.fecha <=> other.fecha
        end
    end
    class APeriodico < Articulo
        attr_reader :periodico, :serie
        def initialize(nombre, fecha, autor, numero, pagina, periodico, serie)
            super(nombre, fecha, autor, numero, pagina)
            @periodico = periodico
            @serie = serie
        end
        def <=> (other)
            self.fecha <=> other.fecha
        end
    end
    class DElectronico < Publicacion
        attr_reader :http, :n_pag, :autor
         def initialize(nombre, fecha, http, n_pag, autor)
             super(nombre, fecha)
             @http = http
             @n_pag = n_pag
             @autor = autor
        end
        def <=> (other)
            self.fecha <=> other.fecha
        end
    end
end #module
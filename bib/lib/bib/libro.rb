module Bib
    class Libro
        attr_accessor :autores, :titulo, :serie, :editorial, :edicion, :publicacion, :isbn
        def initialize(aur, tit, s, edl, edic, fech, i)
            @autores =  aur
            @titulo = tit
            @serie = s
            @editorial = edl
            @edicion = edic
            @publicacion = fech
            @isbn = i
        end
        def autor_to_s
            return autores.map { |i| i.to_s}.join(",")
        end
        def titulo_to_s
            return titulo.map { |i| i.to_s}.join(",")
        end
        def serie_to_s
            return serie.map { |i| i.to_s}.join(",")
        end
        def editorial_to_s
            return editorial.map { |i| i.to_s}.join(",")
        end
        def edicion_to_s
            return edicion.map { |i| i.to_s}.join(",")
        end
        def publicacion_to_s
            return publicacion.map { |i| i.to_s}.join(",")
        end
        def isbn_to_s
            return isbn.map { |i| i.to_s}.join(",")
        end
        def to_s
            libro = [autor_to_s, titulo_to_s, serie_to_s, editorial_to_s, edicion_to_s, publicacion_to_s, isbn_to_s]
            return libro
        end
    end
end
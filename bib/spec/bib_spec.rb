require 'spec_helper'

describe Bib do
  describe 'Lista' do
    before :each do
      @lista = Bib::Lista.new()
    
      @autor = ("Dave Thomas,Andy Hunt,Chad Fowler").split(/,/)
      @titulo = ["Programming Ruby 1.9 & 2.0"]
      @serie = ["The Facets of Ruby"]
      @editorial = ["Pragmatic Bookshelf"]
      @edicion = ["4 edition"]
      @publicacion = ["July 7, 2013"]
      @isbn = ("978-1937785499,1937785491").split(/,/)
      
      @libro = Bib::Libro.new(@autor,@titulo,@serie,@editorial,@edicion,@publicacion,@isbn)
      @n1 = Bib::Nodo.new(@libro, nil, nil)
          
      @autor = ("Scott Chacon").split(/,/)
      @titulo = ["Pro Git"]
      @serie = ["Pro"]
      @editorial = ["Apress"]
      @edicion = ["2009"]
      @publicacion = ["August 27, 2009"]
      @isbn = ("978-1430218333,1430218339").split(/,/)
      
      @libro = Bib::Libro.new(@autor,@titulo,@serie,@editorial,@edicion,@publicacion,@isbn)
      @n2 = Bib::Nodo.new(@libro, nil, nil)
          
      @autor = ("David Flanagan,Yukihiro Matsumotos").split(/,/)
      @titulo = ["The Ruby Programming Language"]
      @serie = []
      @editorial = ["O’Reilly Media"]
      @edicion = ["1 edition"]
      @publicacion = ["February 4, 2008"]
      @isbn = ("978-0596516178,1430218339").split(/,/)
        
      @libro = Bib::Libro.new(@autor,@titulo,@serie,@editorial,@edicion,@publicacion,@isbn)
      @n3 = Bib::Nodo.new(@libro, nil, nil)
          
      @autor = ("David Chelimsky,Dave Astels,Bryan Helmkamp,Dan North,Zach Dennis,Aslak Hellesoy").split(/,/)
      @titulo = ["The Rspec Book: Behaviour Driven Development with RSpes"]
      @serie = ["Cucumber, and Friends (The Facets of Ruby)"]
      @editorial = ["Pragmatic Bookshelf"]
      @edicion = ["1 edition"]
      @publicacion = ["December 25, 2010"]
      @isbn = ("978-1934356371,1934356379").split(/,/)
      
      @libro = Bib::Libro.new(@autor,@titulo,@serie,@editorial,@edicion,@publicacion,@isbn)
      @n4 = Bib::Nodo.new(@libro, nil, nil)
        
      @autor = ("Richard E. Silverman").split(/,/)
      @titulo = ["Git Pocket Guide"]
      @serie = []
      @editorial = ["O’Reilly Media"]
      @edicion = ["1 edition"]
      @publicacion = ["August 2, 2013"]
      @isbn = ("978-1449325862,1449325866").split(/,/)
      
      @libro = Bib::Libro.new(@autor,@titulo,@serie,@editorial,@edicion,@publicacion,@isbn)
      @n5 = Bib::Nodo.new(@libro, nil, nil)
      
      @lista.add(@n1)
      @lista.add(@n2)
    end #before
    it "Debe existir un Nodo de la lista con sus datos y su siguiente" do
      expect(@lista.head.value).to be == @n1.value
      expect(@lista.head.next.value).to be == @n2.value
    end
    it "Se extrae el primer elemento de la lista" do
      expect(@lista.del_head).to be == @n1.value
      expect(@lista.head.value).to be == @n2.value
    end
    it "Se puede insertar un elemento" do
      @lista.add(@n3)
       expect(@lista.tail.value).to be == @n3.value
    end
    it "Se pueden insertar varios elementos" do
      @lista.add_collection([@n4,@n5])
      expect(@lista.tail.value).to be == @n5.value
    end
    it "Debe una lista con su cabeza" do
      expect(@lista.head).not_to be_nil
    end
    it "Es una lista doblemente enlazaada" do
       @lista.add(@n3)
       @lista.add(@n4)
       @lista.add(@n5)
       expect(@lista.head.next.next.next.next.value).to be == @n5.value
       expect(@lista.tail.previus.previus.previus.previus.value).to be == @n1.value
       expect(@lista.head.previus).to be_nil
       expect(@lista.tail.next).to be_nil
    end
  end #describe lista
  describe 'Publicacion' do
    before :each do
      @p = Bib::Publicacion.new("Nombre publicacion","4-2-2015")
    end # before
    it "Existe la clase Publicacion" do
      expect(@p.nombre).to be == "Nombre publicacion"
      expect(@p.fecha).to be == "4-2-2015"
    end
  end #describa publiacion
  describe 'Articulo' do
    before :each do
      @a = Bib::Articulo.new("Nombre publicacion","4-2-2015","Manuel","10","140")
    end # before
    it "Articulo hereda de Publicacion" do
       @a.is_a? Bib::Publicacion
    end
  end #describa articulo
  describe 'ARevista' do
    before :each do
      @ar = Bib::ARevista.new("Nombre publicacion","4-2-2015","Manuel","10","140","Marca","5")
    end # before
    it "Articulo hereda de Articulo" do
      @ar.is_a? Bib::Articulo
    end
  end #describa articulo de revista
  describe 'APeriodico' do
    before :each do
      @ap = Bib::APeriodico.new("Nombre publicacion","4-2-2015","Manuel","10","140","El Dia","1")
    end # before
    it "Articulo hereda de Articulo" do
       @ap.is_a? Bib::Articulo
    end
  end #describa articulo de periodico
  describe 'DElectronico' do
    before :each do
      @de = Bib::DElectronico.new("Nombre publicacion","4-2-2015","www.delectronico.es", "20", "Juan")
    end # before
    it "Articulo hereda de Publicaicon" do
       @de.is_a? Bib::Publicacion
    end
  end #describa articulo de revista
end #describe bib
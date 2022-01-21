require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cargando Materiales..."

CSV.foreach(Rails.root.join('db/data/materials.csv'), headers: true) do |row|
    begin
        material = Material.create( {
            code: row["Codigo"], 
            name: row["Nombre"],
            unity: row["Unidad"], 
            description: row["Descripcion"],
            price: row["Precio"],
            category: row["Categoria"]
        } )
        if material.save
            puts "Material #{material.code} Cargado."
        else
            raise "Error al cargar Material #{material.code}: #{material.errors.full_messages.to_sentence}."
        end
    rescue Exception => ex
        puts ex
    end
end

puts "Materiales Cargados."


# Main Function
def nyc_pigeon_organizer(data)
  names = findNames(data)
  findTraits(data, names)
  toHash(findTraits(data, names))
end

# Array To Hash Conversion
def toHash(array)
  bird_list = {}
  properties = []

  array.each do |organize| #REF1
    # Create Top Level Hash
    if !bird_list.include?(organize[0])
      bird_list[organize[0]] = {}
    end
    if !bird_list[organize[0]].include?(organize[1])
      bird_list[organize[0]][organize[1]] = []
    end
    if !bird_list[organize[0]][organize[1]].include?(organize[2])
      bird_list[organize[0]][organize[1]] << organize[2].to_s
    end
  end

  return bird_list
end

# Bird Trait Retriever
def findTraits(data, birds)
  traitsArray = []

  data.each do |dataKey, dataValue|
    dataValue.each do |traitKey, traitValue|
      findNames(data).each do |names|
        traitValue.each do |whoIs|
          if whoIs == names          
            traitsArray << [names, dataKey,traitKey]
          end
        end
      end  
    end
  end

  return traitsArray
end

# Bird Name Retriever
def findNames(data)
  pigeon_names = []

  data.each do |dataKey, dataValue|
    dataValue.each do |traitKey, traitValue| 
      traitValue.each do |name|
        if !pigeon_names.include?(name)
          pigeon_names << name
        end
      end
    end
  end

  return pigeon_names
end
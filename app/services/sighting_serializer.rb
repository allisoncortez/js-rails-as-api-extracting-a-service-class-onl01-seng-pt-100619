class SightingSerializer
    # CONFIGURING THE SERIALIZER:
    # 1. define initialize method for the class
    def initialize(sighting_object)
        @sighting = sighting_object
    end

    # 2. Write a method that calls .to_json on this instance variable
    # (handling the conclusion/exclusion of attributes, returns the results)
    def to_serialized_json
        options = {
          include: {
            bird: {
              only: [:name, :species]
            },
            location: {
              only: [:latitude, :longitude]
            }
          },
          except: [:updated_at],
        }
        @sighting.to_json(options)
      end


end
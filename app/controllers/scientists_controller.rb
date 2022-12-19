class ScientistsController < ApplicationController


    def index
        render json: Scientist.all
    end


    def show

        found_scientist = Scientist.find_by( id: params[:id] )
        # found_scientist = Scientist.find_by_id( params[:id] )

        if found_scientist
            render json: found_scientist, serializer: ScientistShowSerializer
        else
            render json: { "error": "Scientist not found" }, status: :not_found
        end

    end


    def create

        new_scientist = Scientist.create( new_scientist_params )

        if new_scientist.valid?

            render json: new_scientist

        else
            render json: new_scientist.errors.full_messages, status: :unprocessable_entity
        end

    end



    def update

        scientist_to_patch = Scientist.find_by( id: params[:id] )


        if scientist_to_patch ## IF we Found the Scientist -> Continue the PATCH/update


            scientist_to_patch.update( edit_scientist_params )
            # scientist_to_patch.errors


            if scientist_to_patch.valid?
    
                render json: scientist_to_patch
    
            else
    
                render json: { "errors": scientist_to_patch.errors.full_messages }, status: :unprocessable_entity
    
            end


        else
            render json: { "error": "Scientist not found" }, status: :not_found
        end


    end


    def destroy

        some_scientist_to_delete = Scientist.find_by( id: params[:id] )

        if some_scientist_to_delete  ## Found them?

            some_scientist_to_delete.destroy

            #  render json: {}
            head :no_content
        else
            render json: { "error": "Scientist not found" }, status: :not_found
        end

    end




    private  ########

    def new_scientist_params
        params.permit( :name , :field_of_study , :avatar ) 
    end

    def edit_scientist_params
        params.permit( :name , :field_of_study , :avatar ) 
    end


end

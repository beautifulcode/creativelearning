class PagesController < ResourceController::Base
  
  before_filter :login_required, :except => ['show']
  
  resource_controller
  
  show do
    before do
      @page ||= Page.find_by_permalink('page-not-found')
    end
  end
  
  private
      def object
        unless @object
          if params[:path]
            @object = Page.find_by_permalink(params[:path].last)
          else
            @object = Page.find_by_permalink(params[:id])
          end
        end
        @object
      end

end

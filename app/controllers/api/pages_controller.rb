class Api::PagesController < InheritedResources::Base
  respond_to :xml, :json
  respond_to :html, :only => [ :new, :edit ]
  # actions :all, :except => [:new, :edit] #created new and edit pages to simulate add/edit via json call
  custom_actions :resource => [:publish, :total_words], :collection => [:published, :unpublished]
  
  def total_words
    @page = Page.find(params[:id])
    respond_to do |format|
      format.xml { render :xml => @page.to_xml(:only => [:title, :content], :methods => :total_words) }
      format.json { render :json => @page.as_json(:only => [:title, :content], :methods => :total_words) }
    end
  end
  
  def publish
    publish! do
      @page.publish!
    end
  end
  
  def published
    @pages = collection.published.latest.all
    respond_to do |format|
      format.xml { render :xml => @pages }
      format.json { render :json => @pages }
    end
  end

  def unpublished
    @pages = collection.unpublished.latest.all
    respond_to do |format|
      format.xml { render :xml => @pages }
      format.json { render :json => @pages }
    end
  end
  
  def update
    super do |format|
      format.xml { render :xml => @page }
      format.json { render :json => @page }
    end
  end
end

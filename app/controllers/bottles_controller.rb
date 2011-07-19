class BottlesController < ApplicationController
  
  # GET /bottles
  # GET /bottles.xml
  def index
    #@bottles = Bottle.all
    if params[:user_id].nil?
      @bottles = Bottle.all
    else
      @bottles = User.find(params[:user_id]).bottles
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bottles }
			format.json { render :json => @bottles }
    end
  end
  
  def local
    @bottles = Bottle.where(" lat > ? and lat < ? and long > ? and long < ? ",params[:lat1],params[:lat2],params[:long1],params[:long2]).order("time DESC").limit(params[:recent])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bottles }
			format.json { render :json => @bottles }
    end
  end
  
  def localbefore
    inttime = Integer(params[:beforetime])
	if (inttime > 0)
  	@bottles = Bottle.where(" lat > ? and lat < ? and long > ? and long < ? and time > ? ",params[:lat1],params[:lat2],params[:long1],params[:long2],params[:beforetime]).order("time DESC").limit(params[:recent])  
	else
		@bottles = Bottle.where(" lat > ? and lat < ? and long > ? and long < ? and time < ? ",params[:lat1],params[:lat2],params[:long1],params[:long2],-1 * inttime).order("time ASC").limit(params[:recent])
	end  
    respond_to do |format|
    format.html # index.html.erb
    format.xml  { render :xml => @bottles }
		format.json { render :json => @bottles }
  end
  end
  
  
  def recent
    @bottles = Bottle.recent

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bottles }
			format.json { render :json => @bottles }
    end
  end
  

  # GET /bottles/1
  # GET /bottles/1.xml
  def show
    @bottle = Bottle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bottle }
    	format.json { render :json => @bottle }
		end
  end

  # GET /bottles/new
  # GET /bottles/new.xml
  def new
    @bottle = Bottle.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bottle }
			format.json { render :json => @bottle }
    end
  end

  # GET /bottles/1/edit
  def edit
    @bottle = Bottle.find(params[:id])
  end

  # POST /bottles
  # POST /bottles.xml
  def create
    @bottle = Bottle.new(params[:bottle])

    respond_to do |format|
      if @bottle.save
        format.html { redirect_to(@bottle, :notice => 'Bottle was successfully created.') }
        format.xml  { render :xml => @bottle, :status => :created, :location => @bottle }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bottle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bottles/1
  # PUT /bottles/1.xml
  def update
    @bottle = Bottle.find(params[:id])

    respond_to do |format|
      if @bottle.update_attributes(params[:bottle])
        format.html { redirect_to(@bottle, :notice => 'Bottle was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bottle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bottles/1
  # DELETE /bottles/1.xml
  def destroy
    @bottle = Bottle.find(params[:id])
    @bottle.destroy

    respond_to do |format|
      format.html { redirect_to(bottles_url) }
      format.xml  { head :ok }
    end
  end
end

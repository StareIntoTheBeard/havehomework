class DashboardsController < InheritedResources::Base

	def index
		@user = User.find(current_user.id)
		@subjects = @user.subjects.all()
		respond_to do |format|
	      format.html # index.html.erb
	    end
	end


	def subjects
		@user = User.find(current_user.id)
		@subjects = Subject.all()
		@dashboard = @user.subjects
		respond_to do |format|
	      format.html # index.html.erb
	    end
	end

	def update_subjects
		@user = User.find(current_user.id)
		@subjects = params[:user]['subject_ids']
		@subjects = @subjects.collect{|i| i.to_i}
		@subjects = Subject.find(@subjects)
		@user.subjects = @subjects
		respond_to do |format|
	    	format.html { redirect_to '/dashboard', notice: 'Subjects were successfully updated.' }
	    end
	end

end

get '/' do
  @all_tasks = Task.all
  p @all_tasks
  erb :index
end

post '/add_task' do
  Task.create(title: params[:title], content: params[:content])
  redirect '/'
end

delete '/:id' do
  task = Task.find_by_id(params[:id])
  task.destroy
  redirect '/'
end

get '/:id/update' do
  @task = Task.find_by_id(params[:id])
  erb :update
end

put '/:id/update' do
  Task.update(params[:id], title: params[:title], content: params[:content])
  redirect '/'
end
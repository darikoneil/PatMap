function f_DA_load_results(app,results)

file_loc= app.file_loc;
load(file_loc);

app.results = results;
app.params = params;
app.model_collection=model_collection;
app.best_model=best_model;
%app.best_model_index = best_model_index;
f_DA_update_log(app, 'Results Loaded');
f_DA_load_params(app,results);
f_DA_update_log(app, 'Params Loaded');
end
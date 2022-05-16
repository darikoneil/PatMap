function f_DA_evaluateBestModel(app)

%% Function to run assessment of decoding performance on the best model
            f_DA_update_log(app, 'Now Assessing Decoding Performance');
            f_DA_assess_decoding(app);
            f_DA_find_PR_baseline(app);
            f_DA_plot_decoding(app);
            f_DA_update_decoding_text(app);
            f_DA_model_value(app);
            f_DA_update_structPred_decoding(app);
            f_DA_update_log(app, 'Finished Assessing Decoding Performance');
end
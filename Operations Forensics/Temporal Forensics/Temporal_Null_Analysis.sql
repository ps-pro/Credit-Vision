/*
* Temporal Null Value Analysis for LendingClub Accepted Loans
* ========================================================
* 
* Purpose:
* This query performs a comprehensive year-by-year analysis of null values
* for all columns in the LendingClub accepted loans table.
*
* Output:
* - Groups data by loan issue year
* - For each column, calculates:
*   1. Count of non-null values
*   2. Percentage of non-null values
*
* Key Components:
* - Year Extraction: Uses EXTRACT(YEAR FROM TO_DATE(issue_d, 'Mon-YYYY'))
* - Null Analysis: COUNT(column) for non-null values
* - Percentage Calculation: (COUNT(column) * 100.0 / COUNT(*))
*
* Note: 
* - All percentages are rounded to 2 decimal places
* - Results are filtered to exclude rows with NULL issue_d
* - Results are ordered by issue year ascending
*/

SELECT
    -- Extract the year from the 'issue_d' column
    EXTRACT(YEAR FROM TO_DATE(issue_d, 'Mon-YYYY')) AS issue_year,

    -- This gives the total number of loans for that year
    COUNT(*) AS total_records_for_year,

    -- This section counts non-null values for each column and calculates the percentage of non-null values
    -- The format function is used to dynamically create the COUNT and percentage columns for each column in the table
    -- ==================================================================
    COUNT(id) AS id_non_null_count, ROUND((COUNT(id) * 100.0 / COUNT(*)), 2) AS id_non_null_pct,
    COUNT(member_id) AS member_id_non_null_count, ROUND((COUNT(member_id) * 100.0 / COUNT(*)), 2) AS member_id_non_null_pct,
    COUNT(loan_amnt) AS loan_amnt_non_null_count, ROUND((COUNT(loan_amnt) * 100.0 / COUNT(*)), 2) AS loan_amnt_non_null_pct,
    COUNT(funded_amnt) AS funded_amnt_non_null_count, ROUND((COUNT(funded_amnt) * 100.0 / COUNT(*)), 2) AS funded_amnt_non_null_pct,
    COUNT(funded_amnt_inv) AS funded_amnt_inv_non_null_count, ROUND((COUNT(funded_amnt_inv) * 100.0 / COUNT(*)), 2) AS funded_amnt_inv_non_null_pct,
    COUNT(term) AS term_non_null_count, ROUND((COUNT(term) * 100.0 / COUNT(*)), 2) AS term_non_null_pct,
    COUNT(int_rate) AS int_rate_non_null_count, ROUND((COUNT(int_rate) * 100.0 / COUNT(*)), 2) AS int_rate_non_null_pct,
    COUNT(installment) AS installment_non_null_count, ROUND((COUNT(installment) * 100.0 / COUNT(*)), 2) AS installment_non_null_pct,
    COUNT(grade) AS grade_non_null_count, ROUND((COUNT(grade) * 100.0 / COUNT(*)), 2) AS grade_non_null_pct,
    COUNT(sub_grade) AS sub_grade_non_null_count, ROUND((COUNT(sub_grade) * 100.0 / COUNT(*)), 2) AS sub_grade_non_null_pct,
    COUNT(emp_title) AS emp_title_non_null_count, ROUND((COUNT(emp_title) * 100.0 / COUNT(*)), 2) AS emp_title_non_null_pct,
    COUNT(emp_length) AS emp_length_non_null_count, ROUND((COUNT(emp_length) * 100.0 / COUNT(*)), 2) AS emp_length_non_null_pct,
    COUNT(home_ownership) AS home_ownership_non_null_count, ROUND((COUNT(home_ownership) * 100.0 / COUNT(*)), 2) AS home_ownership_non_null_pct,
    COUNT(annual_inc) AS annual_inc_non_null_count, ROUND((COUNT(annual_inc) * 100.0 / COUNT(*)), 2) AS annual_inc_non_null_pct,
    COUNT(verification_status) AS verification_status_non_null_count, ROUND((COUNT(verification_status) * 100.0 / COUNT(*)), 2) AS verification_status_non_null_pct,
    COUNT(loan_status) AS loan_status_non_null_count, ROUND((COUNT(loan_status) * 100.0 / COUNT(*)), 2) AS loan_status_non_null_pct,
    COUNT(pymnt_plan) AS pymnt_plan_non_null_count, ROUND((COUNT(pymnt_plan) * 100.0 / COUNT(*)), 2) AS pymnt_plan_non_null_pct,
    COUNT(url) AS url_non_null_count, ROUND((COUNT(url) * 100.0 / COUNT(*)), 2) AS url_non_null_pct,
    COUNT("desc") AS desc_non_null_count, ROUND((COUNT("desc") * 100.0 / COUNT(*)), 2) AS desc_non_null_pct,
    COUNT(purpose) AS purpose_non_null_count, ROUND((COUNT(purpose) * 100.0 / COUNT(*)), 2) AS purpose_non_null_pct,
    COUNT(title) AS title_non_null_count, ROUND((COUNT(title) * 100.0 / COUNT(*)), 2) AS title_non_null_pct,
    COUNT(zip_code) AS zip_code_non_null_count, ROUND((COUNT(zip_code) * 100.0 / COUNT(*)), 2) AS zip_code_non_null_pct,
    COUNT(addr_state) AS addr_state_non_null_count, ROUND((COUNT(addr_state) * 100.0 / COUNT(*)), 2) AS addr_state_non_null_pct,
    COUNT(dti) AS dti_non_null_count, ROUND((COUNT(dti) * 100.0 / COUNT(*)), 2) AS dti_non_null_pct,
    COUNT(delinq_2yrs) AS delinq_2yrs_non_null_count, ROUND((COUNT(delinq_2yrs) * 100.0 / COUNT(*)), 2) AS delinq_2yrs_non_null_pct,
    COUNT(earliest_cr_line) AS earliest_cr_line_non_null_count, ROUND((COUNT(earliest_cr_line) * 100.0 / COUNT(*)), 2) AS earliest_cr_line_non_null_pct,
    COUNT(fico_range_low) AS fico_range_low_non_null_count, ROUND((COUNT(fico_range_low) * 100.0 / COUNT(*)), 2) AS fico_range_low_non_null_pct,
    COUNT(fico_range_high) AS fico_range_high_non_null_count, ROUND((COUNT(fico_range_high) * 100.0 / COUNT(*)), 2) AS fico_range_high_non_null_pct,
    COUNT(inq_last_6mths) AS inq_last_6mths_non_null_count, ROUND((COUNT(inq_last_6mths) * 100.0 / COUNT(*)), 2) AS inq_last_6mths_non_null_pct,
    COUNT(mths_since_last_delinq) AS mths_since_last_delinq_non_null_count, ROUND((COUNT(mths_since_last_delinq) * 100.0 / COUNT(*)), 2) AS mths_since_last_delinq_non_null_pct,
    COUNT(mths_since_last_record) AS mths_since_last_record_non_null_count, ROUND((COUNT(mths_since_last_record) * 100.0 / COUNT(*)), 2) AS mths_since_last_record_non_null_pct,
    COUNT(open_acc) AS open_acc_non_null_count, ROUND((COUNT(open_acc) * 100.0 / COUNT(*)), 2) AS open_acc_non_null_pct,
    COUNT(pub_rec) AS pub_rec_non_null_count, ROUND((COUNT(pub_rec) * 100.0 / COUNT(*)), 2) AS pub_rec_non_null_pct,
    COUNT(revol_bal) AS revol_bal_non_null_count, ROUND((COUNT(revol_bal) * 100.0 / COUNT(*)), 2) AS revol_bal_non_null_pct,
    COUNT(revol_util) AS revol_util_non_null_count, ROUND((COUNT(revol_util) * 100.0 / COUNT(*)), 2) AS revol_util_non_null_pct,
    COUNT(total_acc) AS total_acc_non_null_count, ROUND((COUNT(total_acc) * 100.0 / COUNT(*)), 2) AS total_acc_non_null_pct,
    COUNT(initial_list_status) AS initial_list_status_non_null_count, ROUND((COUNT(initial_list_status) * 100.0 / COUNT(*)), 2) AS initial_list_status_non_null_pct,
    COUNT(out_prncp) AS out_prncp_non_null_count, ROUND((COUNT(out_prncp) * 100.0 / COUNT(*)), 2) AS out_prncp_non_null_pct,
    COUNT(out_prncp_inv) AS out_prncp_inv_non_null_count, ROUND((COUNT(out_prncp_inv) * 100.0 / COUNT(*)), 2) AS out_prncp_inv_non_null_pct,
    COUNT(total_pymnt) AS total_pymnt_non_null_count, ROUND((COUNT(total_pymnt) * 100.0 / COUNT(*)), 2) AS total_pymnt_non_null_pct,
    COUNT(total_pymnt_inv) AS total_pymnt_inv_non_null_count, ROUND((COUNT(total_pymnt_inv) * 100.0 / COUNT(*)), 2) AS total_pymnt_inv_non_null_pct,
    COUNT(total_rec_prncp) AS total_rec_prncp_non_null_count, ROUND((COUNT(total_rec_prncp) * 100.0 / COUNT(*)), 2) AS total_rec_prncp_non_null_pct,
    COUNT(total_rec_int) AS total_rec_int_non_null_count, ROUND((COUNT(total_rec_int) * 100.0 / COUNT(*)), 2) AS total_rec_int_non_null_pct,
    COUNT(total_rec_late_fee) AS total_rec_late_fee_non_null_count, ROUND((COUNT(total_rec_late_fee) * 100.0 / COUNT(*)), 2) AS total_rec_late_fee_non_null_pct,
    COUNT(recoveries) AS recoveries_non_null_count, ROUND((COUNT(recoveries) * 100.0 / COUNT(*)), 2) AS recoveries_non_null_pct,
    COUNT(collection_recovery_fee) AS collection_recovery_fee_non_null_count, ROUND((COUNT(collection_recovery_fee) * 100.0 / COUNT(*)), 2) AS collection_recovery_fee_non_null_pct,
    COUNT(last_pymnt_d) AS last_pymnt_d_non_null_count, ROUND((COUNT(last_pymnt_d) * 100.0 / COUNT(*)), 2) AS last_pymnt_d_non_null_pct,
    COUNT(last_pymnt_amnt) AS last_pymnt_amnt_non_null_count, ROUND((COUNT(last_pymnt_amnt) * 100.0 / COUNT(*)), 2) AS last_pymnt_amnt_non_null_pct,
    COUNT(next_pymnt_d) AS next_pymnt_d_non_null_count, ROUND((COUNT(next_pymnt_d) * 100.0 / COUNT(*)), 2) AS next_pymnt_d_non_null_pct,
    COUNT(last_credit_pull_d) AS last_credit_pull_d_non_null_count, ROUND((COUNT(last_credit_pull_d) * 100.0 / COUNT(*)), 2) AS last_credit_pull_d_non_null_pct,
    COUNT(last_fico_range_high) AS last_fico_range_high_non_null_count, ROUND((COUNT(last_fico_range_high) * 100.0 / COUNT(*)), 2) AS last_fico_range_high_non_null_pct,
    COUNT(last_fico_range_low) AS last_fico_range_low_non_null_count, ROUND((COUNT(last_fico_range_low) * 100.0 / COUNT(*)), 2) AS last_fico_range_low_non_null_pct,
    COUNT(collections_12_mths_ex_med) AS collections_12_mths_ex_med_non_null_count, ROUND((COUNT(collections_12_mths_ex_med) * 100.0 / COUNT(*)), 2) AS collections_12_mths_ex_med_non_null_pct,
    COUNT(mths_since_last_major_derog) AS mths_since_last_major_derog_non_null_count, ROUND((COUNT(mths_since_last_major_derog) * 100.0 / COUNT(*)), 2) AS mths_since_last_major_derog_non_null_pct,
    COUNT(policy_code) AS policy_code_non_null_count, ROUND((COUNT(policy_code) * 100.0 / COUNT(*)), 2) AS policy_code_non_null_pct,
    COUNT(application_type) AS application_type_non_null_count, ROUND((COUNT(application_type) * 100.0 / COUNT(*)), 2) AS application_type_non_null_pct,
    COUNT(annual_inc_joint) AS annual_inc_joint_non_null_count, ROUND((COUNT(annual_inc_joint) * 100.0 / COUNT(*)), 2) AS annual_inc_joint_non_null_pct,
    COUNT(dti_joint) AS dti_joint_non_null_count, ROUND((COUNT(dti_joint) * 100.0 / COUNT(*)), 2) AS dti_joint_non_null_pct,
    COUNT(verification_status_joint) AS verification_status_joint_non_null_count, ROUND((COUNT(verification_status_joint) * 100.0 / COUNT(*)), 2) AS verification_status_joint_non_null_pct,
    COUNT(acc_now_delinq) AS acc_now_delinq_non_null_count, ROUND((COUNT(acc_now_delinq) * 100.0 / COUNT(*)), 2) AS acc_now_delinq_non_null_pct,
    COUNT(tot_coll_amt) AS tot_coll_amt_non_null_count, ROUND((COUNT(tot_coll_amt) * 100.0 / COUNT(*)), 2) AS tot_coll_amt_non_null_pct,
    COUNT(tot_cur_bal) AS tot_cur_bal_non_null_count, ROUND((COUNT(tot_cur_bal) * 100.0 / COUNT(*)), 2) AS tot_cur_bal_non_null_pct,
    COUNT(open_acc_6m) AS open_acc_6m_non_null_count, ROUND((COUNT(open_acc_6m) * 100.0 / COUNT(*)), 2) AS open_acc_6m_non_null_pct,
    COUNT(open_act_il) AS open_act_il_non_null_count, ROUND((COUNT(open_act_il) * 100.0 / COUNT(*)), 2) AS open_act_il_non_null_pct,
    COUNT(open_il_12m) AS open_il_12m_non_null_count, ROUND((COUNT(open_il_12m) * 100.0 / COUNT(*)), 2) AS open_il_12m_non_null_pct,
    COUNT(open_il_24m) AS open_il_24m_non_null_count, ROUND((COUNT(open_il_24m) * 100.0 / COUNT(*)), 2) AS open_il_24m_non_null_pct,
    COUNT(mths_since_rcnt_il) AS mths_since_rcnt_il_non_null_count, ROUND((COUNT(mths_since_rcnt_il) * 100.0 / COUNT(*)), 2) AS mths_since_rcnt_il_non_null_pct,
    COUNT(total_bal_il) AS total_bal_il_non_null_count, ROUND((COUNT(total_bal_il) * 100.0 / COUNT(*)), 2) AS total_bal_il_non_null_pct,
    COUNT(il_util) AS il_util_non_null_count, ROUND((COUNT(il_util) * 100.0 / COUNT(*)), 2) AS il_util_non_null_pct,
    COUNT(open_rv_12m) AS open_rv_12m_non_null_count, ROUND((COUNT(open_rv_12m) * 100.0 / COUNT(*)), 2) AS open_rv_12m_non_null_pct,
    COUNT(open_rv_24m) AS open_rv_24m_non_null_count, ROUND((COUNT(open_rv_24m) * 100.0 / COUNT(*)), 2) AS open_rv_24m_non_null_pct,
    COUNT(max_bal_bc) AS max_bal_bc_non_null_count, ROUND((COUNT(max_bal_bc) * 100.0 / COUNT(*)), 2) AS max_bal_bc_non_null_pct,
    COUNT(all_util) AS all_util_non_null_count, ROUND((COUNT(all_util) * 100.0 / COUNT(*)), 2) AS all_util_non_null_pct,
    COUNT(total_rev_hi_lim) AS total_rev_hi_lim_non_null_count, ROUND((COUNT(total_rev_hi_lim) * 100.0 / COUNT(*)), 2) AS total_rev_hi_lim_non_null_pct,
    COUNT(inq_fi) AS inq_fi_non_null_count, ROUND((COUNT(inq_fi) * 100.0 / COUNT(*)), 2) AS inq_fi_non_null_pct,
    COUNT(total_cu_tl) AS total_cu_tl_non_null_count, ROUND((COUNT(total_cu_tl) * 100.0 / COUNT(*)), 2) AS total_cu_tl_non_null_pct,
    COUNT(inq_last_12m) AS inq_last_12m_non_null_count, ROUND((COUNT(inq_last_12m) * 100.0 / COUNT(*)), 2) AS inq_last_12m_non_null_pct,
    COUNT(acc_open_past_24mths) AS acc_open_past_24mths_non_null_count, ROUND((COUNT(acc_open_past_24mths) * 100.0 / COUNT(*)), 2) AS acc_open_past_24mths_non_null_pct,
    COUNT(avg_cur_bal) AS avg_cur_bal_non_null_count, ROUND((COUNT(avg_cur_bal) * 100.0 / COUNT(*)), 2) AS avg_cur_bal_non_null_pct,
    COUNT(bc_open_to_buy) AS bc_open_to_buy_non_null_count, ROUND((COUNT(bc_open_to_buy) * 100.0 / COUNT(*)), 2) AS bc_open_to_buy_non_null_pct,
    COUNT(bc_util) AS bc_util_non_null_count, ROUND((COUNT(bc_util) * 100.0 / COUNT(*)), 2) AS bc_util_non_null_pct,
    COUNT(chargeoff_within_12_mths) AS chargeoff_within_12_mths_non_null_count, ROUND((COUNT(chargeoff_within_12_mths) * 100.0 / COUNT(*)), 2) AS chargeoff_within_12_mths_non_null_pct,
    COUNT(delinq_amnt) AS delinq_amnt_non_null_count, ROUND((COUNT(delinq_amnt) * 100.0 / COUNT(*)), 2) AS delinq_amnt_non_null_pct,
    COUNT(mo_sin_old_il_acct) AS mo_sin_old_il_acct_non_null_count, ROUND((COUNT(mo_sin_old_il_acct) * 100.0 / COUNT(*)), 2) AS mo_sin_old_il_acct_non_null_pct,
    COUNT(mo_sin_old_rev_tl_op) AS mo_sin_old_rev_tl_op_non_null_count, ROUND((COUNT(mo_sin_old_rev_tl_op) * 100.0 / COUNT(*)), 2) AS mo_sin_old_rev_tl_op_non_null_pct,
    COUNT(mo_sin_rcnt_rev_tl_op) AS mo_sin_rcnt_rev_tl_op_non_null_count, ROUND((COUNT(mo_sin_rcnt_rev_tl_op) * 100.0 / COUNT(*)), 2) AS mo_sin_rcnt_rev_tl_op_non_null_pct,
    COUNT(mo_sin_rcnt_tl) AS mo_sin_rcnt_tl_non_null_count, ROUND((COUNT(mo_sin_rcnt_tl) * 100.0 / COUNT(*)), 2) AS mo_sin_rcnt_tl_non_null_pct,
    COUNT(mort_acc) AS mort_acc_non_null_count, ROUND((COUNT(mort_acc) * 100.0 / COUNT(*)), 2) AS mort_acc_non_null_pct,
    COUNT(mths_since_recent_bc) AS mths_since_recent_bc_non_null_count, ROUND((COUNT(mths_since_recent_bc) * 100.0 / COUNT(*)), 2) AS mths_since_recent_bc_non_null_pct,
    COUNT(mths_since_recent_bc_dlq) AS mths_since_recent_bc_dlq_non_null_count, ROUND((COUNT(mths_since_recent_bc_dlq) * 100.0 / COUNT(*)), 2) AS mths_since_recent_bc_dlq_non_null_pct,
    COUNT(mths_since_recent_inq) AS mths_since_recent_inq_non_null_count, ROUND((COUNT(mths_since_recent_inq) * 100.0 / COUNT(*)), 2) AS mths_since_recent_inq_non_null_pct,
    COUNT(mths_since_recent_revol_delinq) AS mths_since_recent_revol_delinq_non_null_count, ROUND((COUNT(mths_since_recent_revol_delinq) * 100.0 / COUNT(*)), 2) AS mths_since_recent_revol_delinq_non_null_pct,
    COUNT(num_accts_ever_120_pd) AS num_accts_ever_120_pd_non_null_count, ROUND((COUNT(num_accts_ever_120_pd) * 100.0 / COUNT(*)), 2) AS num_accts_ever_120_pd_non_null_pct,
    COUNT(num_actv_bc_tl) AS num_actv_bc_tl_non_null_count, ROUND((COUNT(num_actv_bc_tl) * 100.0 / COUNT(*)), 2) AS num_actv_bc_tl_non_null_pct,
    COUNT(num_actv_rev_tl) AS num_actv_rev_tl_non_null_count, ROUND((COUNT(num_actv_rev_tl) * 100.0 / COUNT(*)), 2) AS num_actv_rev_tl_non_null_pct,
    COUNT(num_bc_sats) AS num_bc_sats_non_null_count, ROUND((COUNT(num_bc_sats) * 100.0 / COUNT(*)), 2) AS num_bc_sats_non_null_pct,
    COUNT(num_bc_tl) AS num_bc_tl_non_null_count, ROUND((COUNT(num_bc_tl) * 100.0 / COUNT(*)), 2) AS num_bc_tl_non_null_pct,
    COUNT(num_il_tl) AS num_il_tl_non_null_count, ROUND((COUNT(num_il_tl) * 100.0 / COUNT(*)), 2) AS num_il_tl_non_null_pct,
    COUNT(num_op_rev_tl) AS num_op_rev_tl_non_null_count, ROUND((COUNT(num_op_rev_tl) * 100.0 / COUNT(*)), 2) AS num_op_rev_tl_non_null_pct,
    COUNT(num_rev_accts) AS num_rev_accts_non_null_count, ROUND((COUNT(num_rev_accts) * 100.0 / COUNT(*)), 2) AS num_rev_accts_non_null_pct,
    COUNT(num_rev_tl_bal_gt_0) AS num_rev_tl_bal_gt_0_non_null_count, ROUND((COUNT(num_rev_tl_bal_gt_0) * 100.0 / COUNT(*)), 2) AS num_rev_tl_bal_gt_0_non_null_pct,
    COUNT(num_sats) AS num_sats_non_null_count, ROUND((COUNT(num_sats) * 100.0 / COUNT(*)), 2) AS num_sats_non_null_pct,
    COUNT(num_tl_120dpd_2m) AS num_tl_120dpd_2m_non_null_count, ROUND((COUNT(num_tl_120dpd_2m) * 100.0 / COUNT(*)), 2) AS num_tl_120dpd_2m_non_null_pct,
    COUNT(num_tl_30dpd) AS num_tl_30dpd_non_null_count, ROUND((COUNT(num_tl_30dpd) * 100.0 / COUNT(*)), 2) AS num_tl_30dpd_non_null_pct,
    COUNT(num_tl_90g_dpd_24m) AS num_tl_90g_dpd_24m_non_null_count, ROUND((COUNT(num_tl_90g_dpd_24m) * 100.0 / COUNT(*)), 2) AS num_tl_90g_dpd_24m_non_null_pct,
    COUNT(num_tl_op_past_12m) AS num_tl_op_past_12m_non_null_count, ROUND((COUNT(num_tl_op_past_12m) * 100.0 / COUNT(*)), 2) AS num_tl_op_past_12m_non_null_pct,
    COUNT(pct_tl_nvr_dlq) AS pct_tl_nvr_dlq_non_null_count, ROUND((COUNT(pct_tl_nvr_dlq) * 100.0 / COUNT(*)), 2) AS pct_tl_nvr_dlq_non_null_pct,
    COUNT(percent_bc_gt_75) AS percent_bc_gt_75_non_null_count, ROUND((COUNT(percent_bc_gt_75) * 100.0 / COUNT(*)), 2) AS percent_bc_gt_75_non_null_pct,
    COUNT(pub_rec_bankruptcies) AS pub_rec_bankruptcies_non_null_count, ROUND((COUNT(pub_rec_bankruptcies) * 100.0 / COUNT(*)), 2) AS pub_rec_bankruptcies_non_null_pct,
    COUNT(tax_liens) AS tax_liens_non_null_count, ROUND((COUNT(tax_liens) * 100.0 / COUNT(*)), 2) AS tax_liens_non_null_pct,
    COUNT(tot_hi_cred_lim) AS tot_hi_cred_lim_non_null_count, ROUND((COUNT(tot_hi_cred_lim) * 100.0 / COUNT(*)), 2) AS tot_hi_cred_lim_non_null_pct,
    COUNT(total_bal_ex_mort) AS total_bal_ex_mort_non_null_count, ROUND((COUNT(total_bal_ex_mort) * 100.0 / COUNT(*)), 2) AS total_bal_ex_mort_non_null_pct,
    COUNT(total_bc_limit) AS total_bc_limit_non_null_count, ROUND((COUNT(total_bc_limit) * 100.0 / COUNT(*)), 2) AS total_bc_limit_non_null_pct,
    COUNT(total_il_high_credit_limit) AS total_il_high_credit_limit_non_null_count, ROUND((COUNT(total_il_high_credit_limit) * 100.0 / COUNT(*)), 2) AS total_il_high_credit_limit_non_null_pct,
    COUNT(revol_bal_joint) AS revol_bal_joint_non_null_count, ROUND((COUNT(revol_bal_joint) * 100.0 / COUNT(*)), 2) AS revol_bal_joint_non_null_pct,
    COUNT(sec_app_fico_range_low) AS sec_app_fico_range_low_non_null_count, ROUND((COUNT(sec_app_fico_range_low) * 100.0 / COUNT(*)), 2) AS sec_app_fico_range_low_non_null_pct,
    COUNT(sec_app_fico_range_high) AS sec_app_fico_range_high_non_null_count, ROUND((COUNT(sec_app_fico_range_high) * 100.0 / COUNT(*)), 2) AS sec_app_fico_range_high_non_null_pct,
    COUNT(sec_app_earliest_cr_line) AS sec_app_earliest_cr_line_non_null_count, ROUND((COUNT(sec_app_earliest_cr_line) * 100.0 / COUNT(*)), 2) AS sec_app_earliest_cr_line_non_null_pct,
    COUNT(sec_app_inq_last_6mths) AS sec_app_inq_last_6mths_non_null_count, ROUND((COUNT(sec_app_inq_last_6mths) * 100.0 / COUNT(*)), 2) AS sec_app_inq_last_6mths_non_null_pct,
    COUNT(sec_app_mort_acc) AS sec_app_mort_acc_non_null_count, ROUND((COUNT(sec_app_mort_acc) * 100.0 / COUNT(*)), 2) AS sec_app_mort_acc_non_null_pct,
    COUNT(sec_app_open_acc) AS sec_app_open_acc_non_null_count, ROUND((COUNT(sec_app_open_acc) * 100.0 / COUNT(*)), 2) AS sec_app_open_acc_non_null_pct,
    COUNT(sec_app_revol_util) AS sec_app_revol_util_non_null_count, ROUND((COUNT(sec_app_revol_util) * 100.0 / COUNT(*)), 2) AS sec_app_revol_util_non_null_pct,
    COUNT(sec_app_open_act_il) AS sec_app_open_act_il_non_null_count, ROUND((COUNT(sec_app_open_act_il) * 100.0 / COUNT(*)), 2) AS sec_app_open_act_il_non_null_pct,
    COUNT(sec_app_num_rev_accts) AS sec_app_num_rev_accts_non_null_count, ROUND((COUNT(sec_app_num_rev_accts) * 100.0 / COUNT(*)), 2) AS sec_app_num_rev_accts_non_null_pct,
    COUNT(sec_app_chargeoff_within_12_mths) AS sec_app_chargeoff_within_12_mths_non_null_count, ROUND((COUNT(sec_app_chargeoff_within_12_mths) * 100.0 / COUNT(*)), 2) AS sec_app_chargeoff_within_12_mths_non_null_pct,
    COUNT(sec_app_collections_12_mths_ex_med) AS sec_app_collections_12_mths_ex_med_non_null_count, ROUND((COUNT(sec_app_collections_12_mths_ex_med) * 100.0 / COUNT(*)), 2) AS sec_app_collections_12_mths_ex_med_non_null_pct,
    COUNT(sec_app_mths_since_last_major_derog) AS sec_app_mths_since_last_major_derog_non_null_count, ROUND((COUNT(sec_app_mths_since_last_major_derog) * 100.0 / COUNT(*)), 2) AS sec_app_mths_since_last_major_derog_non_null_pct,
    COUNT(hardship_flag) AS hardship_flag_non_null_count, ROUND((COUNT(hardship_flag) * 100.0 / COUNT(*)), 2) AS hardship_flag_non_null_pct,
    COUNT(hardship_type) AS hardship_type_non_null_count, ROUND((COUNT(hardship_type) * 100.0 / COUNT(*)), 2) AS hardship_type_non_null_pct,
    COUNT(hardship_reason) AS hardship_reason_non_null_count, ROUND((COUNT(hardship_reason) * 100.0 / COUNT(*)), 2) AS hardship_reason_non_null_pct,
    COUNT(hardship_status) AS hardship_status_non_null_count, ROUND((COUNT(hardship_status) * 100.0 / COUNT(*)), 2) AS hardship_status_non_null_pct,
    COUNT(deferral_term) AS deferral_term_non_null_count, ROUND((COUNT(deferral_term) * 100.0 / COUNT(*)), 2) AS deferral_term_non_null_pct,
    COUNT(hardship_amount) AS hardship_amount_non_null_count, ROUND((COUNT(hardship_amount) * 100.0 / COUNT(*)), 2) AS hardship_amount_non_null_pct,
    COUNT(hardship_start_date) AS hardship_start_date_non_null_count, ROUND((COUNT(hardship_start_date) * 100.0 / COUNT(*)), 2) AS hardship_start_date_non_null_pct,
    COUNT(hardship_end_date) AS hardship_end_date_non_null_count, ROUND((COUNT(hardship_end_date) * 100.0 / COUNT(*)), 2) AS hardship_end_date_non_null_pct,
    COUNT(payment_plan_start_date) AS payment_plan_start_date_non_null_count, ROUND((COUNT(payment_plan_start_date) * 100.0 / COUNT(*)), 2) AS payment_plan_start_date_non_null_pct,
    COUNT(hardship_length) AS hardship_length_non_null_count, ROUND((COUNT(hardship_length) * 100.0 / COUNT(*)), 2) AS hardship_length_non_null_pct,
    COUNT(hardship_dpd) AS hardship_dpd_non_null_count, ROUND((COUNT(hardship_dpd) * 100.0 / COUNT(*)), 2) AS hardship_dpd_non_null_pct,
    COUNT(hardship_loan_status) AS hardship_loan_status_non_null_count, ROUND((COUNT(hardship_loan_status) * 100.0 / COUNT(*)), 2) AS hardship_loan_status_non_null_pct,
    COUNT(orig_projected_additional_accrued_interest) AS orig_projected_additional_accrued_interest_non_null_count, ROUND((COUNT(orig_projected_additional_accrued_interest) * 100.0 / COUNT(*)), 2) AS orig_projected_additional_accrued_interest_non_null_pct,
    COUNT(hardship_payoff_balance_amount) AS hardship_payoff_balance_amount_non_null_count, ROUND((COUNT(hardship_payoff_balance_amount) * 100.0 / COUNT(*)), 2) AS hardship_payoff_balance_amount_non_null_pct,
    COUNT(hardship_last_payment_amount) AS hardship_last_payment_amount_non_null_count, ROUND((COUNT(hardship_last_payment_amount) * 100.0 / COUNT(*)), 2) AS hardship_last_payment_amount_non_null_pct,
    COUNT(disbursement_method) AS disbursement_method_non_null_count, ROUND((COUNT(disbursement_method) * 100.0 / COUNT(*)), 2) AS disbursement_method_non_null_pct,
    COUNT(debt_settlement_flag) AS debt_settlement_flag_non_null_count, ROUND((COUNT(debt_settlement_flag) * 100.0 / COUNT(*)), 2) AS debt_settlement_flag_non_null_pct,
    COUNT(debt_settlement_flag_date) AS debt_settlement_flag_date_non_null_count, ROUND((COUNT(debt_settlement_flag_date) * 100.0 / COUNT(*)), 2) AS debt_settlement_flag_date_non_null_pct,
    COUNT(settlement_status) AS settlement_status_non_null_count, ROUND((COUNT(settlement_status) * 100.0 / COUNT(*)), 2) AS settlement_status_non_null_pct,
    COUNT(settlement_date) AS settlement_date_non_null_count, ROUND((COUNT(settlement_date) * 100.0 / COUNT(*)), 2) AS settlement_date_non_null_pct,
    COUNT(settlement_amount) AS settlement_amount_non_null_count, ROUND((COUNT(settlement_amount) * 100.0 / COUNT(*)), 2) AS settlement_amount_non_null_pct,
    COUNT(settlement_percentage) AS settlement_percentage_non_null_count, ROUND((COUNT(settlement_percentage) * 100.0 / COUNT(*)), 2) AS settlement_percentage_non_null_pct,
    COUNT(settlement_term) AS settlement_term_non_null_count, ROUND((COUNT(settlement_term) * 100.0 / COUNT(*)), 2) AS settlement_term_non_null_pct
FROM
    lending_club.accepted
WHERE
    -- This helps prevent errors from any potentially malformed date entries
    issue_d IS NOT NULL
GROUP BY
    issue_year
ORDER BY
    issue_year;
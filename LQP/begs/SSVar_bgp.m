res_ss=vertcat(ss_Q*ss_b2 - (psi - 1)*ss_c2^sigma*ss_l2/((ss_l2 - 1)*psi) + (psi - 1)*ss_c1^sigma*ss_l1/((ss_l1 - 1)*psi) - ss_b2 - ss_c1 + ss_c2, -ss_l1*ss_theta_1 - ss_l2*ss_theta_2 + ss_c1 + ss_c2 + ss_g, ss_c2^sigma/((ss_l2 - 1)*ss_theta_2) - ss_c1^sigma/((ss_l1 - 1)*ss_theta_1));
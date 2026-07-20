/* cap input rows for the captured run */
options obs=100;

/*
 * 逻辑库 pad 的样例数据 —— 原脚本指向本地路径 C:\Users\...\back，
 * 此处用两个小样例数据集代替，保持脚本的“枚举 + 循环导出”逻辑不变。
 * Sample data for libname pad. The original script points at a local
 * path; here two small sample datasets stand in so the enumerate-then-
 * export logic runs unchanged.
 */
libname pad (work);

data pad.class;
  set sashelp.class(obs=12);
run;

data pad.cars;
  set sashelp.cars(obs=10 keep=make model type origin msrp);
run;

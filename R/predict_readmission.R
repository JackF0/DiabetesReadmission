#' 预测糖尿病患者再入院风险
#'
#' @description
#' 这个函数加载预训练的随机森林模型，并基于输入的患者特征数据预测其 30 天内再入院的风险。
#'
#' @param new_data 一个数据框 (data.frame)，必须包含模型所需的特征列。
#' 建议使用包内自带的 \code{sample_diabetes} 作为模板。
#'
#' @return 一个包含预测类别的向量 (例如 "NO", ">30", "<30")。
#' @export
#'
#' @importFrom stats predict
#' @examples
#' \dontrun{
#' # 使用包内自带的示例数据进行测试
#' data("sample_diabetes")
#' predictions <- predict_readmission(sample_diabetes)
#' print(predictions)
#' }
predict_readmission <- function(new_data) {

  # 1. 动态查找模型文件的路径
  # system.file 会在用户安装后的包目录里寻找 inst/extdata 下的文件
  model_path <- system.file("extdata", "final_model.rds", package = "DiabetesReadmission")

  if (model_path == "") {
    stop("错误：无法在包中找到 'final_model.rds' 模型文件。请检查安装。")
  }

  # 2. 加载模型
  final_model <- readRDS(model_path)

  # 3. 检查输入数据是否有效 (简单的防呆检查)
  if (!is.data.frame(new_data)) {
    stop("错误：输入数据 'new_data' 必须是一个数据框 (data frame)。")
  }

  # 4. 进行预测
  # 注意：这里假设 new_data 的列名和类型与模型训练时一致
  tryCatch({
    prediction <- predict(final_model, newdata = new_data)
    return(prediction)
  }, error = function(e) {
    message("预测过程中发生错误。常见原因：输入数据的列名或数据类型与模型不匹配。")
    message("详细错误信息：", e$message)
    return(NULL)
  })
}


from comfy_runner.inf import ComfyRunner

runner = ComfyRunner()
output = runner.predict(
    workflow_input="examples/txt2img/workflow_api.json",
    stop_server_after_completion=True,
)

print("final output: ", output)
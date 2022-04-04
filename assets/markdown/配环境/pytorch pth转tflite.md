# 首先将torch转onnx

```
def torch_pth_to_onnx(model: torch.nn.Module, pth_path, shape_test: tuple):
    state_dict = torch.load(pth_path)
    model.load_state_dict(state_dict)
    torch.onnx.export(model, torch.randn(shape_test), "model/converting-tmp.onnx")

```


# 然后将onnx转换成tflite






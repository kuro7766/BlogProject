例如: hook `print` 函数

```
my_hook_target_function_name = 'c_fun'
hook_function_tmp_storage = eval(my_hook_target_function_name)
def _hook_target_function_replacement(*args, **kwargs):
    hook_function_tmp_storage(*args, **kwargs)
    # do your things
    info = 'hook method [' + my_hook_target_function_name + ']...'
exec(my_hook_target_function_name + '=_hook_target_function_replacement')

```






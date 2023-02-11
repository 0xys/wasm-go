(module
  (func $sum
    (param $p1 i32) (param $p2 i32) (result i32)
      i32.const 10
      local.get $p1
      local.get $p2
      i32.add
      i32.add
    )
  (export "sum" (func $sum))
)

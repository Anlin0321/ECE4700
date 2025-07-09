@echo off
REM Execute generator.py with all config files
python generator.py --config test0_simple.yaml
python generator.py --config test1_high_taken.yaml
python generator.py --config test2_high_untaken.yaml
python generator.py --config test3_deep_nesting.yaml
python generator.py --config test4_mixed_hazards.yaml
python generator.py --config test5_loop_dominated.yaml
python generator.py --config test6_long.yaml

REM Execute interpreter.py with all config files
python interpreter.py --config test0_simple_t.yaml
python interpreter.py --config test1_high_taken_t.yaml
python interpreter.py --config test2_high_untaken_t.yaml
python interpreter.py --config test3_deep_nesting_t.yaml
python interpreter.py --config test4_mixed_hazards_t.yaml
python interpreter.py --config test5_loop_dominated_t.yaml
python interpreter.py --config test6_long_t.yaml

echo All commands executed successfully.
pause
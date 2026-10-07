# pwm_top integration spec

## Purpose

A PWM generator built from a free-running counter and a comparator.

## Top-level ports

| Port | Dir | Width | Description |
| --- | --- | --- | --- |
| `clk` | in | 1 | Clock |
| `rst_n` | in | 1 | Asynchronous reset, active low |
| `enable` | in | 1 | Run the counter |
| `duty` | in | 8 | Duty cycle, 0 = always low |
| `pwm_out` | out | 1 | PWM output |

## Instances

| Instance | Module | Notes |
| --- | --- | --- |
| `u_counter` | `counter` | 8-bit |
| `u_pwm` | `pwm_compare` | |

## Connections

- `u_counter` counts while `enable` is high.
- `u_counter.count` drives `u_pwm.count`.
- `duty` drives `u_pwm.duty`.
- `u_pwm.pwm` drives `pwm_out`.

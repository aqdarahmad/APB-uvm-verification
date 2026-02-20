# APB UVM Verification Project

## Project Overview
This project implements a **UVM-based verification environment** for an **APB (Advanced Peripheral Bus) slave interface**.  
It is designed to verify the functionality of the APB slave RTL module, ensuring correct protocol behavior, transactions, and data integrity.  

The environment is fully modular and reusable, using UVM components such as **agents, drivers, monitors, sequencers, scoreboards, and sequences**.

---

## Directory Structure



rtl/
apb_slave.sv # APB slave RTL module

tb/
apb_if.sv # APB interface definition
apb_transaction.sv # APB transaction class
apb_sequence.sv # UVM sequence for generating transactions
apb_sequencer.sv # Sequencer class
apb_driver.sv # Driver class
apb_monitor.sv # Monitor class
apb_scoreboard.sv # Scoreboard for result comparison
apb_agent.sv # Agent connecting driver, sequencer, monitor
apb_env.sv # Environment connecting agents and scoreboard
apb_test.sv # UVM test class


---

## Features

- **Reusable UVM Components**: Fully modular for reuse with other APB slaves.  
- **Transaction-based Verification**: Stimulus generated using sequences and transactions.  
- **Scoreboard Comparison**: Ensures DUT output matches expected results.  
- **Randomized Transactions**: Covers multiple scenarios and corner cases.  
- **Raise/Drop Objections**: Correctly manages simulation time with UVM phases.  

---

## Getting Started

### Prerequisites
- **Cadence Xcelium (xrun)** or any UVM-compatible simulator  
- SystemVerilog compiler  

### Running Simulation
1. Compile the project using `filelist.f`:

```bash
xrun -uvm -f filelist.f

top.sv # Top-level module instantiating DUT and interface
filelist.f # File list for simulation compilation

# 32-Bit 5-Stage Pipelined Processor Using Verilog HDL

## Overview

This project presents the design and implementation of a **32-Bit 5-Stage Pipelined Processor** using **Verilog HDL**. The processor improves instruction throughput by dividing instruction execution into five pipeline stages and executing multiple instructions simultaneously.

The design includes **pipeline registers**, **forwarding logic**, **hazard detection**, and **branch handling** to ensure correct execution while maximizing performance.

The processor was developed and verified using **Xilinx Vivado Design Suite**.

---

## Features

* 32-Bit Processor Architecture
* 5-Stage Instruction Pipeline
* Verilog HDL Implementation
* Pipeline Registers
* Forwarding Unit
* Hazard Detection Unit
* Branch Control Logic
* Register File
* Arithmetic Logic Unit (ALU)
* Data Memory
* Instruction Memory
* RTL Verification
* Behavioral Simulation in Vivado

---

## Pipeline Stages

### 1. Instruction Fetch (IF)

* Fetches instructions from Instruction Memory.
* Updates Program Counter (PC).

### 2. Instruction Decode (ID)

* Decodes instruction fields.
* Reads source operands from Register File.
* Generates control signals.

### 3. Execute (EX)

* Performs ALU operations.
* Computes branch targets.
* Executes forwarding logic.

### 4. Memory Access (MEM)

* Reads and writes Data Memory.
* Processes branch decisions.

### 5. Write Back (WB)

* Writes results back into Register File.

---

## Implemented Modules

### Core Modules

* PC.v
* Instruction_Memory.v
* register_file.v
* control_unit.v
* ALU_Control.v
* aluu.v
* DataMemory.v

### Pipeline Registers

* IF_ID.v
* ID_EX.v
* EX_MEM.v
* MEM_WB.v

### Hazard Handling

* ForwardingUnit.v
* Hazard_Detection.v

### Branch Handling

* BranchControl.v
* Branch_Comparator.v

### Top-Level Integration

* Pipeline_Processor.v

---

## Supported Operations

### Arithmetic Instructions

* ADD
* SUB
* AND
* OR
* XOR

### Memory Instructions

* LOAD
* STORE

### Control Instructions

* Branch Operations

---

## Pipeline Features

### Forwarding Unit

Reduces data hazards by forwarding results directly from later pipeline stages to the Execute stage.

### Hazard Detection Unit

Detects load-use hazards and inserts stalls when necessary.

### Branch Handling

Supports branch comparison and branch target selection to maintain correct program flow.

---

## Project Structure

```text
32-bit-5-stage-pipelined-processor-verilog/
│
├── Source_Code/
│   ├── PC.v
│   ├── Instruction_Memory.v
│   ├── register_file.v
│   ├── control_unit.v
│   ├── ALU_Control.v
│   ├── aluu.v
│   ├── DataMemory.v
│   ├── IF_ID.v
│   ├── ID_EX.v
│   ├── EX_MEM.v
│   ├── MEM_WB.v
│   ├── ForwardingUnit.v
│   ├── Hazard_Detection.v
│   ├── BranchControl.v
│   ├── Branch_Comparator.v
│   └── Pipeline_Processor.v
│
├── Testbench/
│   └── Pipeline_Processor_tb.v
│
├── Architecture/
│   └── Pipeline_Architecture.png
│
├── Simulation_Results/
│   ├── Pipeline_Waveform_1.png
│   ├── Pipeline_Waveform_2.png
│   └── Pipeline_Waveform_3.png
│
└── README.md
```

---

## Verification Results

Simulation confirms:

* Correct instruction fetching
* Proper pipeline operation
* Correct register read/write functionality
* Hazard detection and stalling
* Forwarding path operation
* Branch execution and flushing
* Correct memory access
* Successful write-back operations

---

## Tools Used

* Verilog HDL
* Xilinx Vivado Design Suite
* Vivado Simulator
* RTL Schematic Viewer
* Computer Architecture
* Digital Logic Design

---

## Future Enhancements

* Complete RISC-V ISA Support
* Branch Prediction Unit
* Cache Memory Integration
* Out-of-Order Execution
* Superscalar Architecture
* FPGA Implementation

---

## Author

**Bellam Udaya Sree**
B.Tech – Electronics & Communication Engineering
JNTUA College of Engineering, Ananthapuramu

### Connect With Me

* GitHub: https://github.com/udayasree-vlsi
* LinkedIn: https://www.linkedin.com/in/udaya-sree-4b00a1304

---

## Project Status

✅ Completed
✅ Simulated Successfully
✅ Pipeline Verified
✅ Hazard Detection Verified
✅ Forwarding Verified
✅ RTL Generated

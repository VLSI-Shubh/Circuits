# ⚡ Circuits

Welcome to the **Circuits** repository — a personal collection of modular Verilog code for various **combinational** and **sequential** digital circuits. This repo is structured to serve as a reusable library of synthesizable modules that can be directly plugged into larger designs or used for quick prototyping and testing.

---

## 📘 Description

This repository is primarily maintained as a hands-on space to:

- Keep foundational Verilog coding skills sharp.
- Build and reuse modular, **parameterized**, and **synthesizable** circuits.
- Organize circuit designs for future use in bigger projects.
- Maintain a clean library of tested and verified digital design blocks.

It contains two main directories:

- `combinational_circuits/`: for purely combinational logic modules.
- `sequential_circuits/`: for FSMs, memory blocks, counters, and other sequential modules.

Each module typically includes:
- Well-documented Verilog code
- Testbenches for functional simulation
- Output waveforms (via `.vcd` or `.png`)
- Optional synthesis reports 

For specific implementation details, please refer to the corresponding folders.

---

## ✅ Circuits Completed

### 🔗 Combinational Circuits

- [x] [Multiplexers (2:1, N:1)](https://github.com/VLSI-Shubh/Circuits/tree/f914d47fa4d4471710e87d10c38f4f9c7562b113/Combinational%20Circuits/Mux)
- [x] [Subtractor](https://github.com/VLSI-Shubh/Circuits/tree/f914d47fa4d4471710e87d10c38f4f9c7562b113/Combinational%20Circuits/Subtractor)
- [x] [Comparator](https://github.com/VLSI-Shubh/Circuits/tree/f914d47fa4d4471710e87d10c38f4f9c7562b113/Combinational%20Circuits/Comparator)

### 🔁 Sequential Circuits

- [x] [Shift Register](https://github.com/VLSI-Shubh/Circuits/tree/f914d47fa4d4471710e87d10c38f4f9c7562b113/Sequential%20Circuits/Shift%20Registers)
- [x] [Timer Using Counter](https://github.com/VLSI-Shubh/Circuits/tree/f914d47fa4d4471710e87d10c38f4f9c7562b113/Sequential%20Circuits/Counter/Timer)
- [x] [Decade Counter](https://github.com/VLSI-Shubh/Circuits/tree/f914d47fa4d4471710e87d10c38f4f9c7562b113/Sequential%20Circuits/Counter/Decade%20counter)

---

## 🧩 Circuits Planned

- [ ] 8-bit ALU (Arithmetic and Logic Unit)
- [ ] Priority Encoder (N-bit)
- [ ] Barrel Shifter
- [ ] Synchronizer 
- [ ] 4:2 Compressor
- [ ] Synchronous Up/Down Counter
- [ ] Debounce Circuit


---

## 🛠️ Usage

Each module is standalone. You can navigate to the folder of interest, copy the module code into your project, and run the testbench using a simulator like Icarus Verilog, ModelSim, or EDA Playground.

Most of the modules are:
- **Parameterizable** (`width`, `depth`, etc.)
- **Reusable**
- **Synthesizable**

---

## 🎯 Goal

This is not a tutorial-based repository — the goal is to maintain a **clean, personal, and reusable circuit library** for design testing and future integration. If you're exploring this repo, feel free to use or modify the designs as needed.

---

## 📬 Feedback or Contributions?

This is a personal repository maintained for practice and project reuse. However, if you have suggestions or find bugs, feel free to raise an issue or submit a pull request.

---




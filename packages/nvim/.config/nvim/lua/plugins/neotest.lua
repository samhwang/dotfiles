return {
  { "nvim-neotest/neotest-plenary" },
  { "marilari88/neotest-vitest" },
  { "thenbe/neotest-playwright" },
  { "haydenmeade/neotest-jest" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        "neotest-plenary",
        "neotest-jest",
        "neotest-vitest",
        "neotest-playwright"
      }
    },
  },
}

return {
  redis = {
    master = { ip = '127.0.0.1', port = 6379 },
    sb = {
      master_name = 'm6381',
      sentinels = {
        { host = "127.0.0.1", port = "26381" },
        { host = "127.0.0.1", port = "26382" },
        { host = "127.0.0.1", port = "26383" }
      }
    }
  }
}

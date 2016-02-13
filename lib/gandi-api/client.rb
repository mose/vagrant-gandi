module GandiApi
  class Client

    def initialize(opts = {})
      @client = Connection.new opts
    end

    def query(command, opts = {})
      @client.query command, opts
    end

    def query_simple(command)
      @client.query_simple command
    end

    def datacenters
      @_datacenters ||= query('hosting.datacenter.list').reduce({}) do |a, v|
        a[v['dc_code']] = v['id']
        a
      end
    end

    def system_images(dc)
      @_system_images ||= query('hosting.disk.list_kernels', dc)
    end

    def hosting_account_info
      query_simple 'hosting.account.info'
    end

  end
end

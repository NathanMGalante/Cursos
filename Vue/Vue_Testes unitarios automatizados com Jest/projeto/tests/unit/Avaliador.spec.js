import Avaliador from '@/views/Avaliador'
import { mount, RouterLinkStub } from '@vue/test-utils'

import { getLeiloes } from '@/http'

import flushPromises from 'flush-promises'

jest.mock('@/http')

const leiloes = [
	{
		produto: 'Um livro da casa do código',
		lanceInicial: 42,
		descricao: 'Um maravilhoso livro sobre VUE'
	},
	{
		produto: 'Um livro da casa do código',
		lanceInicial: 50,
		descricao: 'Um livro sobre VUE'
	},
	{
		produto: 'Um livro da casa do código',
		lanceInicial: 36,
		descricao: 'outro livro sobre VUE'
	}
]

describe('avaliador que se conecta com a API', () => {
	test('garantir que ele mostra todos os leioloes retornados pela API', async () => {
		getLeiloes.mockResolvedValueOnce(leiloes)

		const wrapper = mount(Avaliador, {
			stubs: {
				RouterLink: RouterLinkStub
			}
		})

		await flushPromises()

		const totalDeLeiloes = wrapper.findAll('.leilao').length

		expect(totalDeLeiloes).toBe(leiloes.length)
	})

	test('não há leioloes retornados pela API', async () => {
		getLeiloes.mockResolvedValueOnce([])

		const wrapper = mount(Avaliador, {
			stubs: {
				RouterLink: RouterLinkStub
			}
		})

		await flushPromises()

		const totalDeLeiloes = wrapper.findAll('.leilao').length

		expect(totalDeLeiloes).toBe(0)
	})
})

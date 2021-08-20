import Leiloeiro from '@/views/Leiloeiro'
import { mount } from '@vue/test-utils'

import { getLeilao, getLances } from '@/http'

import flushPromises from 'flush-promises'

jest.mock('@/http')

const leilao = {
	produto: 'Um livro da casa do código',
	lanceInicial: 49,
	descricao: 'Um maravilhoso livro sobre VUE'
}

describe('Leiloeiro inicial um leilão', () => {
	test('avisa quando não existe lances', async () => {
		getLeilao.mockResolvedValueOnce(leilao)
		getLances.mockResolvedValueOnce([])
		// getLances.mockResolvedValueOnce([
		// 	{
		// 		id: 1,
		// 		valor: 100,
		// 		data: '2021/12/01',
		// 		leilao_id: 1
		// 	}
		// ])

		const wrapper = mount(Leiloeiro, {
			propsData: {
				id: 1
			}
		})

		await flushPromises()

		const alerta = wrapper.find('.alert-dark')

		expect(wrapper).toBeTruthy()
		expect(alerta.exists()).toBe(true)
	})
})

const lances = [
	{
		id: 1,
		valor: 100,
		data: '2021/10/05',
		leilao_id: 1
	},
	{
		id: 2,
		valor: 270,
		data: '2021/09/30',
		leilao_id: 1
	},
	{
		id: 3,
		valor: 456,
		data: '2021/12/01',
		leilao_id: 1
	}
]

describe('um leiloeiro exibe os lances existentes', () => {
	test('não mostrar o aviso de "sem lances"', async () => {
		getLeilao.mockResolvedValueOnce(leilao)
		getLances.mockResolvedValueOnce(lances)

		const wrapper = mount(Leiloeiro, {
			propsData: {
				id: 1
			}
		})

		await flushPromises()

		const alerta = wrapper.find('.alert-dark')

		expect(wrapper).toBeTruthy()
		expect(alerta.exists()).toBe(false)
	})
	test('possui uma lista de lances', async () => {
		getLeilao.mockResolvedValueOnce(leilao)
		getLances.mockResolvedValueOnce(lances)

		const wrapper = mount(Leiloeiro, {
			propsData: {
				id: 1
			}
		})

		await flushPromises()

		const alerta = wrapper.find('.list-inline')

		expect(wrapper).toBeTruthy()
		expect(alerta.exists()).toBe(true)
	})
})

describe('um leiloeiro comunica os valores dos lances', () => {
	test('mostrar maior lance', async () => {
		getLeilao.mockResolvedValueOnce(leilao)
		getLances.mockResolvedValueOnce(lances)

		const wrapper = mount(Leiloeiro, {
			propsData: {
				id: 1
			}
		})

		await flushPromises()

		const maiorLance = wrapper.find('.maior-lance')

		expect(wrapper).toBeTruthy()
		expect(maiorLance.element.textContent).toBe('Maior lance: R$ 456')
	})
	test('mostrar menor lance', async () => {
		getLeilao.mockResolvedValueOnce(leilao)
		getLances.mockResolvedValueOnce(lances)

		const wrapper = mount(Leiloeiro, {
			propsData: {
				id: 1
			}
		})

		await flushPromises()

		const menorLance = wrapper.find('.menor-lance')

		expect(wrapper).toBeTruthy()
		expect(menorLance.element.textContent).toBe('Menor lance: R$ 100')
	})
})

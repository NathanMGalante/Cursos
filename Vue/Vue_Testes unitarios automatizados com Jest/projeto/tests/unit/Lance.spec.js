import Lance from '@/components/Lance'
import { mount } from '@vue/test-utils'

test('Lance.vue (existe)', () => {
	const wrapper = mount(Lance)
	expect(wrapper).toBeTruthy()
})

test('Lance.vue -> input (existe)', () => {
	const wrapper = mount(Lance)
	const input = wrapper.find('input')
	expect(input).toBeTruthy()
})

test('Lance.vue (não aceita valor < zero)', () => {
	const wrapper = mount(Lance)
	const input = wrapper.find('input')
	input.setValue(-100)
	const lancesEmitidos = wrapper.emitted('novo-lance')
	wrapper.trigger('submit')
	expect(lancesEmitidos).toBeUndefined()
})

test('Lance.vue (valor > zero)', () => {
	const wrapper = mount(Lance)
	const input = wrapper.find('input')
	input.setValue(100)
	wrapper.trigger('submit')
	const lancesEmitidos = wrapper.emitted('novo-lance')
	expect(lancesEmitidos).toHaveLength(1)
})

describe('Lance.vue', () => {
	test('emite o valor esperado de um lance valido', () => {
		const wrapper = mount(Lance)
		const input = wrapper.find('input')
		input.setValue(100)
		wrapper.trigger('submit')
		const lancesEmitidos = wrapper.emitted('novo-lance')
		const lance = parseInt(lancesEmitidos[0][0])
		expect(lance).toBe(100)
	})
})

describe('Lance.vue - lance com um valor mínimo', () => {
	test('valor > minimo', () => {
		const wrapper = mount(Lance, {
			propsData: {
				lanceMinimo: 300
			}
		})
		const input = wrapper.find('input');
		input.setValue(400)
		wrapper.trigger('submit')
		const lancesEmitidos = wrapper.emitted('novo-lance')
		expect(lancesEmitidos).toHaveLength(1)
	})

	test('não aceita valor < minimo', async () => {
		const wrapper = mount(Lance, {
			propsData: {
				lanceMinimo: 300
			}
		})
		const input = wrapper.find('input');
		input.setValue(100)
		wrapper.trigger('submit')
		await wrapper.vm.$nextTick()
		const msgErro = wrapper.find('p.alert').element.textContent
		const msgEsperada = 'O valor mínimo para o lance é de R$ 300'
		expect(msgErro).toContain(msgEsperada)
	})

	test('valor esperado de um lance valido', () => {
		const wrapper = mount(Lance, {
			propsData: {
				lanceMinimo: 300
			}
		})
		const input = wrapper.find('input');
		input.setValue(400)
		wrapper.trigger('submit')
		const lancesEmitidos = wrapper.emitted('novo-lance')
		const valorDoLance = parseInt(lancesEmitidos[0][0])
		expect(valorDoLance).toBe(400)
	})
})
